/*
 * This file contains some of the required C goodies that are used but not imported
 * for us by Swift.
 *
 * Copyright (c) Kiad Studios, LLC. All rights reserved.
 * Licensed under the MIT License. See License.md in the project root for license information.
 */

// NOTE(owensd): While Foundation has some of what we need, there is no guarantee that the items
// will be implemented in any timely manner. In addition, if Windows support is taken, Foundation
// will surely not be available.
#if os(Linux)
    import Glibc
#else
    import Darwin
#endif

 /// Based on the file descriptor, the appropriate bit will be set in the `fd_set`.
func set(descriptor: Int32, fd: inout fd_set) {
    let offset = descriptor / 16
    let mask = 1 << (descriptor % 16)

    switch offset {
    case 0: fd.fds_bits.0 |= mask
    case 1: fd.fds_bits.1 |= mask
    case 2: fd.fds_bits.2 |= mask
    case 3: fd.fds_bits.3 |= mask
    case 4: fd.fds_bits.4 |= mask
    case 5: fd.fds_bits.5 |= mask
    case 6: fd.fds_bits.6 |= mask
    case 7: fd.fds_bits.7 |= mask
    case 8: fd.fds_bits.8 |= mask
    case 9: fd.fds_bits.9 |= mask
    case 10: fd.fds_bits.10 |= mask
    case 11: fd.fds_bits.11 |= mask
    case 12: fd.fds_bits.12 |= mask
    case 13: fd.fds_bits.13 |= mask
    case 14: fd.fds_bits.14 |= mask
    case 15: fd.fds_bits.15 |= mask
    default: fatalError("Invalid descriptor offset: \(offset)")
    }
}

/// Resets all of the bits to `0` in the `fd_set`.
@inline(__always) private func zero(fd: inout fd_set) {
    fd.fds_bits = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
}

/// Continually monitors the `stdin` for input. When data is retrieved, that data is passed
/// along to the given `handler`.
func monitorStdIn(dataReceived: (String) -> ()) -> Never {
    var input = fd_set()

    // NOTE(owensd): If you're reading this code... I'm sorry. I'm not 100% that this is
    // actually correct. I *thought* that `read()` could potentially not read the full data,
    // but, I cannot seem to find the documentation to verify that. In any case, this code
    // is likely the most fragile part of the system...

    while (true) {
        zero(fd: &input)
        set(descriptor: STDIN_FILENO, fd: &input)

        let maxMessageSize = 8192
        var buffer = Array<UInt8>(repeating: 0, count: 8192)

        let result = select(STDIN_FILENO + 1, &input, nil, nil, nil)
        if (result == -1) {
            fatalError("*** error in select() ***")
        }
        else if (result > 0) {
            let bytesRead = read(STDIN_FILENO, &buffer, maxMessageSize)
            if (bytesRead < 0) {
                fatalError("error reading data... fix it")
            }
            
            let content = String(cString: &buffer)
            dataReceived(content)
        }
    }
}