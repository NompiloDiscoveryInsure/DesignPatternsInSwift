//
//  InterfacesegragationPrinciple.swift
//  
//
//  Created by Nompilo Moyo on 2023/12/01.

//In the field of software engineering, the interface segregation principle (ISP) states that no code should be forced to depend on methods it does not use. ISP splits interfaces that are very large into smaller and more specific ones so that clients will only have to know about the methods that are of interest to them.

import Foundation

class Document
{

}


protocol Machine
{
  func print(d: Document)
  func scan(d: Document)
  func fax(d: Document)
}

class MFP : Machine
{
  func print(d: Document)
  //
}

enum NoRequiredFunctionality : Error
{
  case doesNotFax
}

class OldFashionedPrinter: Machine
{
  func print(d: Document)
  {
    // ok
  }
  func fax(d: Document)
  {
    throw NoRequiredFunctionality.doesNotFax
  }
}

protocol Printer
{
  func print(d: Document)
}

protocol Scanner
{
  func scan(d: Document)
}

protocol Fax
{
  func fax(d: Document)
}

class OrdinaryPrinter : Printer
{
  func print(d: Document)
  {
    // ok
  }
}

class Photocopier : Printer, Scanner
{
  func print(d: Document)
  {
    // ok
  }

  func scan(d: Document)
  {

  }
}

protocol MultiFunctionDevice : Printer, Scanner, Fax
{
}

class MultiFunctionMachine : MultiFunctionDevice
{
  let printer: Printer
  let scanner: Scanner

  init(printer: Printer, scanner: Scanner)
  {
    self.printer = printer
    self.scanner = scanner
  }

  func print(d: Document)
  {
    printer.print(d) // Decorator
  }
}
