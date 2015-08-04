//===-- Mos6502.td - Describe the Mos6502 Target Machine ---*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Target-independent interfaces which we are implementing
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// Register File, Calling Conv, Instruction Descriptions
//===----------------------------------------------------------------------===//

include "Mos6502RegisterInfo.td"
include "Mos6502CallingConv.td"
include "Mos6502InstrInfo.td"

def Mos6502InstrInfo : InstrInfo;

def Mos6502AsmParser : AsmParser {
  bit ShouldEmitMatchRegisterName = 0;
}

//===----------------------------------------------------------------------===//
// MOS6502 processors supported.
//===----------------------------------------------------------------------===//

class Proc<string Name, list<SubtargetFeature> Features>
 : Processor<Name, NoItineraries, Features>;

def : Proc<"generic", []>;

//===----------------------------------------------------------------------===//
// Declare the target which we are implementing
//===----------------------------------------------------------------------===//

def Mos6502AsmWriter : AsmWriter {
  string AsmWriterClassName  = "InstPrinter";
  int PassSubtarget = 1;
  int Variant = 0;
}

def Mos6502 : Target {
  // Pull in Instruction Info:
  let InstructionSet = Mos6502InstrInfo;
  let AssemblyParsers  = [Mos6502AsmParser];
  let AssemblyWriters = [Mos6502AsmWriter];
}
