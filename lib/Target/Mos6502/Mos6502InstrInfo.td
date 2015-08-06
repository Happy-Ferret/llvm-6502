//===-- Mos6502InstrInfo.td - Target Description for Mos6502 Target -------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file describes the Mos6502 instructions in TableGen format.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Instruction format superclass
//===----------------------------------------------------------------------===//

include "Mos6502InstrFormats.td"

//===----------------------------------------------------------------------===//
// Addition
//===----------------------------------------------------------------------===//

/*
let isCommutable = 1,
Defs = [A, SREG] in
{
  // ADC imm
  // Adds two 8-bit registers.
  def ADCImm : InstM6502<(outs),
                         (ins i8imm:$k),
                         "adc #$k",
                         [(set A, (add A, i8imm:$k)),
                          (implicit SREG)]>;
}
*/

//===----------------------------------------------------------------------===//
// Increment and Decrement
//===----------------------------------------------------------------------===//
let Defs = [X, SREG] in
{
  def INX : InstM6502<(outs XR:$dst),
                      (ins XR:$src),
                      "inx",
                      [(set XR:$dst, (add XR:$src, 1)), (implicit SREG)]>;

  def DEX : InstM6502<(outs XR:$dst),
                      (ins XR:$src),
                      "dex",
                      [(set XR:$dst, (sub XR:$src, 1)), (implicit SREG)]>;
}

let Defs = [Y, SREG] in
{
  def INY : InstM6502<(outs YR:$dst),
                      (ins YR:$src),
                      "iny",
                      [(set YR:$dst, (add YR:$src, 1)), (implicit SREG)]>;

  def DEY : InstM6502<(outs YR:$dst),
                      (ins YR:$src),
                      "dey",
                      [(set YR:$dst, (sub YR:$src, 1)), (implicit SREG)]>;
}

def NOP : InstM6502<(outs), (ins), "nop", []>;

def ADJCALLSTACKDOWN : Pseudo<(outs), (ins), "#ADJCALLSTACKDOWN", []>;
def ADJCALLSTACKUP : Pseudo<(outs), (ins), "#ADJCALLSTACKUP", []>;
