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

//===----------------------------------------------------------------------===//
// 6502 Return Value Calling Convention
//===----------------------------------------------------------------------===//

def CC_Mos6502 : CallingConv<[
  CCIfType<[i8], CCAssignToReg<[A, X, Y]>>,
  CCAssignToStack<1, 1>
]>;

def RetCC_Mos650232 : CallingConv<[
  CCIfType<[i8], CCAssignToReg<[A, X, Y]>>
]>;

//===----------------------------------------------------------------------===//
// 6502 Argument Calling Conventions
//===----------------------------------------------------------------------===//
