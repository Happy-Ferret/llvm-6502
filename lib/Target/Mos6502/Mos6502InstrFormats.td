//=== Mos6502InstrFormats.td - Mos6502 Instruction Formats -*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

class InstM6502<dag outs, dag ins, string asmstr, list<dag> pattern>
          : Instruction {
  let Namespace = "M6502";

  // All 6502 instructions are 1-byte sized
  field bits<8> Inst;
  let Size = 1;

  dag OutOperandList = outs;
  dag InOperandList = ins;
  let AsmString = asmstr;
  let Pattern = pattern;
}

// A class for pseudo instructions
//
// Psuedo instructions are not real 6502 instructions. The DAG stores psuedo
// instructions which are replaced by real 6502 instructions by
// Mos6502ExpandPseudoInsts.cpp.
//
// For example, the ADDW (add wide, as in add 16 bit values) instruction is
// defined as a pseudo instruction. In Mos6502ExpandPseudoInsts.cpp, the
// instruction is then replaced by two ADC instructions - one for each byte.
//
class Pseudo<dag outs, dag ins, string asmstr, list<dag> pattern>
  : InstM6502<outs, ins, asmstr, pattern>
{
  let Pattern = pattern;

  let isPseudo = 1;
}
