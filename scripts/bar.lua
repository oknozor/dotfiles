local function get_time()
    return os.date("%H:%M:%S %d-%m-%Y")
end

local prev_total = 0
local prev_idle = 0


local function read_file(file)
    local f = io.open(file, "r")
    if not f then
        return nil
    end

    local content = f:read("*all")
    f:close()
    return content
end

local function read_lines(str)
    local lines = {}
    for line in str:gmatch("[^\r\n]+") do
        table.insert(lines, line)
    end
    return lines
end

local function get_cpu_usage()
    local cpu_line = read_file("/proc/stat")
    if not cpu_line then
        return
    end

    local user, nice, system, idle, iowait, irq, softirq, steal = cpu_line:match(
        "cpu%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)")
    user, nice, system, idle, iowait, irq, softirq, steal = tonumber(user), tonumber(nice), tonumber(system),
        tonumber(idle), tonumber(iowait), tonumber(irq), tonumber(softirq), tonumber(steal)

    local total_idle = idle + iowait
    local total_non_idle = user + nice + system + irq + softirq + steal
    local total = total_idle + total_non_idle


    prev_total = prev_total or total
    prev_idle = prev_idle or total_idle

    local total_diff = total - prev_total
    local idle_diff = total_idle - prev_idle

    prev_total = total
    prev_idle = total_idle

    local cpu_percentage = (total_diff - idle_diff) / total_diff * 100

    return string.format("CPU: %.2f%%", cpu_percentage)
end


local function get_ram_usage()
    local file = io.popen("free -m")
    local total_mem, used_mem
    if not file then
        return
    end

    for line in file:lines() do
        local total, used = line:match("^%s*Mem:%s*(%d+)%s*(%d+)")
        if total and used then
            used_mem = tonumber(used)
            total_mem = tonumber(total)
            break
        end
    end

    file:close()

    if total_mem and used_mem then
        local percentage = (used_mem / total_mem) * 100
        return string.format("RAM: %.2f%%", percentage)
    end
end

local function get_battery_status()
    local battery_path = "/sys/class/power_supply/BAT0/"
    if not read_file(battery_path) then
        return
    end

    local capacity = read_file(battery_path .. "capacity")
    local status = read_file(battery_path .. "status"):gsub("%s+", "")
    return string.format("Battery: %d (%s)", capacity, status)
end

while true do
    local cpu = get_cpu_usage()
    local ram = get_ram_usage()
    local time = get_time()
    local status = string.format("%s | %s | %s", cpu, ram, time)
    local battery = get_battery_status()

    if battery then
        status = string.format("%s | %s ", status, battery)
    end
    print(status)
    os.execute("sleep 1")
end
