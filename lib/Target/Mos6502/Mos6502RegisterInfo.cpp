//===-- Mos6502RegisterInfo.cpp - MOS6502 Register Information ------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the MOS6502 implementation of the TargetRegisterInfo class.
//
//===----------------------------------------------------------------------===//

#include "Mos6502RegisterInfo.h"
#include "Mos6502.h"
#include "Mos6502MachineFunctionInfo.h"
#include "Mos6502Subtarget.h"
#include "llvm/ADT/BitVector.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/IR/Type.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Target/TargetInstrInfo.h"

using namespace llvm;

#define GET_REGINFO_TARGET_DESC
#include "Mos6502GenRegisterInfo.inc"

Mos6502RegisterInfo::Mos6502RegisterInfo() : Mos6502GenRegisterInfo(0) {}
