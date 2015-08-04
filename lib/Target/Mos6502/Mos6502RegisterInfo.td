//===-- Mos6502RegisterInfo.td - Mos6502 Register defs -----*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//  Declarations that describe the Mos6502 register file
//===----------------------------------------------------------------------===//

class Mos6502Reg<string n, bits<16> Enc> : Register<n> {
  let HWEncoding = Enc;
  let Namespace = "M6502";
}

//===----------------------------------------------------------------------===//
//  Register definitions
//===----------------------------------------------------------------------===//

def A : Mos6502Reg<"a", 0>;
def X : Mos6502Reg<"x", 1>;
def Y : Mos6502Reg<"y", 2>;

def SP : Mos6502Reg<"sp", 3>;
def PC : Mos6502Reg<"pc", 4>;

def SREG : Mos6502Reg<"sreg", 5>;

//===----------------------------------------------------------------------===//
// Register Class definitions
//===----------------------------------------------------------------------===//

def GPR : RegisterClass<"M6502", [i8], 8, (add A, X, Y)>;

def AR : RegisterClass<"M6502", [i8], 8, (add A)>;
def XR : RegisterClass<"M6502", [i8], 8, (add X)>;
def YR : RegisterClass<"M6502", [i8], 8, (add Y)>;

def CCR : RegisterClass<"M6502", [i8], 8, (add SREG)> {
  let CopyCost = -1;  // Don't allow copying of status register
  let isAllocatable = 0;
}
