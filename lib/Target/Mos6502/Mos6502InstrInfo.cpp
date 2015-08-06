//===-- Mos6502InstrInfo.cpp - Mos6502 Instruction Information ----------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the Mos6502 implementation of the TargetInstrInfo class.
//
//===----------------------------------------------------------------------===//

#include "Mos6502InstrInfo.h"
#include "Mos6502.h"
#include "Mos6502MachineFunctionInfo.h"
#include "Mos6502Subtarget.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineMemOperand.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

#define GET_INSTRINFO_CTOR_DTOR
#include "Mos6502GenInstrInfo.inc"

// Pin the vtable to this file.
void Mos6502InstrInfo::anchor() {}

Mos6502InstrInfo::Mos6502InstrInfo(Mos6502Subtarget &ST)
    : Mos6502GenInstrInfo(M6502::ADJCALLSTACKDOWN, M6502::ADJCALLSTACKUP), RI(),
      Subtarget(ST) {}
