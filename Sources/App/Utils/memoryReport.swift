import Foundation

#if os(macOS)
    func memoryReport() -> String {
        var taskInfo = task_vm_info_data_t()
        var count = mach_msg_type_number_t(MemoryLayout<task_vm_info>.size) / 4
        let result: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), $0, &count)
            }
        }
        let usedMb = Float(taskInfo.phys_footprint) / 1_048_576.0
        let totalMb = Float(ProcessInfo.processInfo.physicalMemory) / 1_048_576.0
        return result != KERN_SUCCESS ? "Memory used: ? of \(totalMb)MB" :
            "Memory used: \(usedMb)MB of \(totalMb)MB"
    }
#endif

#if os(Linux)
    func memoryReport() -> String {
        let url = URL(fileURLWithPath: "/proc/self/statm")
        guard let data = try? Data(contentsOf: url) else { return "Failed to fetch memrory data." }
        guard let string = String(data: data, encoding: .utf8) else { return "Failed to get memory usage." }
        guard let vmRss = string.split(separator: " ").dropFirst().first
        else { return "Failed to get vmRss." }
        guard let vmRssMB = Double(vmRss) else { return "Failed to convert vmRss." }

        // If page size 4096
        return "Memory used: \(vmRssMB * 4 / 1024)MB"
    }
#endif
