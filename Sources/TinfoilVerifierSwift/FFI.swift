//
//  FFI.swift
//  TinfoilVerifier
//
//  Created by Mark @ Germ on 1/27/25.
//

import Foundation
import TinfoilVerifier

//wrappers for the exported objC code from gomoblec

extension Document {
    func verify() throws -> (LiteffiMeasurementFFI, Data) {
        let errorPtr: NSErrorPointer = nil
        let result = LiteffiVerifyDocument(
            format,
            body,
            errorPtr
        )
        if let error = errorPtr?.pointee {
            throw error
        }
        guard let result,
            let measurement = result.measurement,
            let certFingerprint = result.certificateFingerPrint
        else {
            throw TinfoilError.missingResult
        }

        return (measurement, certFingerprint)
    }
}

extension Enclave {
    static func verifyAttestation(
        rootTrustBundle: Data,
        repoBundle: Data,
        repoHash: String,
        repo: String
    ) throws -> LiteffiMeasurementFFI {
        let errorPtr: NSErrorPointer = nil
        let codeMeasurements = LiteffiVerifyMeasurementAttestationFFI(
            rootTrustBundle,
            repoBundle,
            repoHash,
            repo,
            errorPtr
        )

        if let error = errorPtr?.pointee {
            throw error
        }
        guard let codeMeasurements else {
            throw TinfoilError.missingResult
        }

        return codeMeasurements
    }
}

public struct TrustRoot {
    ///client should store this and have policy for refetch
    //since this reaches into sigstore/tuf, maybe live with this being
    //a blocking sync method
    public static func fetchTrustRoot() async throws -> Data {
        let errorPtr: NSErrorPointer = nil
        let result = LiteffiFetchTrustRootFFI(errorPtr)
        if let error = errorPtr?.pointee {
            throw error
        }
        guard let result else {
            throw TinfoilError.missingResult
        }
        return result
    }
}
