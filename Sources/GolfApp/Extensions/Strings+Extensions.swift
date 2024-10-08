//
//  Strings+Extensions.swift
//  golf-app
//
//  Created by Kynan Song on 08/10/2024.
//


#if !SKIP
extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}
#endif

