//===-- Mos6502ISelLowering.cpp - Mos6502 DAG Lowering Implementation ---------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the interfaces that Mos6502 uses to lower LLVM code into a
// selection DAG.
//
//===----------------------------------------------------------------------===//

#include "Mos6502ISelLowering.h"
#include "MCTargetDesc/Mos6502MCExpr.h"
#include "Mos6502MachineFunctionInfo.h"
#include "Mos6502RegisterInfo.h"
#include "Mos6502TargetMachine.h"
#include "llvm/CodeGen/CallingConvLower.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/SelectionDAG.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

Mos6502TargetLowering::Mos6502TargetLowering(TargetMachine &TM,
                                         const Mos6502Subtarget &STI)
    : TargetLowering(TM), Subtarget(&STI) { }
