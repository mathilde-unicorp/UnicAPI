//
//  File.swift
//
//
//  Created by Ressier Mathilde on 10/02/2023.
//

import Foundation

/// Suspends the current task, then calls the given closure after the deadline with a checked throwing
/// continuation for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - deadline: The time at which to schedule the block for execution.
///   - body: A closure that takes a `CheckedContinuation` parameter.
///     You must resume the continuation exactly once.
///
/// If `resume(throwing:)` is called on the continuation,
/// this function throws that error.
func withCheckedThrowingContinuation<T>(
    function: String = #function,
    after deadline: DispatchTime,
    _ body: @escaping (CheckedContinuation<T, Error>) -> Void
) async throws -> T {
    return try await withCheckedThrowingContinuation { continuation in
        DispatchQueue.global(qos: .background).asyncAfter(deadline: deadline) {
            body(continuation)
        }
    }
}
