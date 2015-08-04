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
}
