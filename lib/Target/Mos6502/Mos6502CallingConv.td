//===- Mos6502CallingConv.td - Calling Conventions Mos6502 -*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This describes the calling conventions for the Mos6502 architectures.
//
//===----------------------------------------------------------------------===//

def CC_Mos6502 : CallingConv<[
  CCIfType<[i8], CCAssignToReg<[A, X, Y]>>,
  CCAssignToStack<0, 0>
]>;

def RetCC_Mos650232 : CallingConv<[
  CCIfType<[i8], CCAssignToReg<[A, X, Y]>>
]>;
