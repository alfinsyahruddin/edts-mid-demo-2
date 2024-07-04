//
//  DI.swift
//  EDTSMIDDemo
//
//  Created by M Alfin Syahruddin on 29/06/24.
//


import Foundation
import Swinject


public class DI {
    private static let container = Container()
    private static let assembler = Assembler(
        [
            HomeAssembly()
        ],
        container: DI.container
    )
    
    public static func get<T>(_ type: T.Type) -> T {
        return DI.assembler.resolver.resolve(T.self)!
    }
}

