//===-- Mos6502TargetMachine.cpp - Define TargetMachine for Mos6502 -------===//
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

#include "Mos6502TargetMachine.h"
#include "Mos6502.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

extern "C" void LLVMInitializeMos6502Target() {
  // Register the target.
  RegisterTargetMachine<Mos6502TargetMachine> X(TheMos6502Target);
}

Mos6502TargetMachine::Mos6502TargetMachine(const Target &T, const Triple &TT,
                                       StringRef CPU, StringRef FS,
                                       const TargetOptions &Options,
                                       Reloc::Model RM, CodeModel::Model CM,
                                       CodeGenOpt::Level OL)
    : LLVMTargetMachine(T, "e-p:16:8:8-i8:8:8-i16:8:8-i32:8:8-i64:8:8-f32:8:8-f64:8:8-n8",
            TT, CPU, FS, Options, RM, CM, OL),
      Subtarget(TT, CPU, FS, *this)
{
  initAsmInfo();
}

Mos6502TargetMachine::~Mos6502TargetMachine() {}

namespace {
/// Mos6502 Code Generator Pass Configuration Options.
class Mos6502PassConfig : public TargetPassConfig {
public:
  Mos6502PassConfig(Mos6502TargetMachine *TM, PassManagerBase &PM)
    : TargetPassConfig(TM, PM) {}

  Mos6502TargetMachine &getMos6502TargetMachine() const {
    return getTM<Mos6502TargetMachine>();
  }

  void addIRPasses() override;
  bool addInstSelector() override;
  void addPreEmitPass() override;
};
} // namespace

TargetPassConfig *Mos6502TargetMachine::createPassConfig(PassManagerBase &PM) {
  return new Mos6502PassConfig(this, PM);
}

void Mos6502PassConfig::addIRPasses() {
  addPass(createAtomicExpandPass(&getMos6502TargetMachine()));

  TargetPassConfig::addIRPasses();
}

bool Mos6502PassConfig::addInstSelector() {
  addPass(createMos6502ISelDag(getMos6502TargetMachine()));
  return false;
}

void Mos6502PassConfig::addPreEmitPass() {}
