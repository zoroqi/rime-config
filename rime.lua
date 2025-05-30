--- 过滤器：单字在先
function single_char_first_filter(input)
    local l = {}
    for cand in input:iter() do
        if (utf8.len(cand.text) == 1) then
            yield(cand)
        else
            table.insert(l, cand)
        end
    end
    for i, cand in ipairs(l) do
        yield(cand)
    end
end

--- 过滤器：只显示单字
function single_char_only(input)
    for cand in input:iter() do
        if (utf8.len(cand.text) == 1) then
            yield(cand)
        end
    end
end

function task(input, seg)
    if (input == "ttt") then
        local tdate = "- [ ] [tid::" .. os.date("%Y%m%d-%H%M%S") .. "] "
        local ttt = Candidate("", seg.start, seg._end, tdate, "")
        ttt.quality = 100
        yield(ttt)
    end

    if (input == "tdo") then
        local task_type = "[finish::done " .. os.date("%Y-%m-%d %H:%M:%S") .. "]"
        local cand = Candidate("", seg.start, seg._end, task_type, "")
        cand.quality=1
        yield(cand)
    end

    if (input == "tca") then
        local task_type = "[finish::cancel " .. os.date("%Y-%m-%d %H:%M:%S") .. "]"
        local cand = Candidate("", seg.start, seg._end, task_type, "")
        cand.quality=1
        yield(cand)
    end

    -- if (input == "tdi") then
    --     local task_type = "[finish::discard " .. os.date("%Y-%m-%d %H:%M:%S") .. "]"
    --     local cand = Candidate("", seg.start, seg._end, task_type, "tdo")
    --     cand.quality=1
    --     yield(cand)
    -- end

    -- if (input == "tpe") then
    --     local task_type = "[finish::pending " .. os.date("%Y-%m-%d %H:%M:%S") .. "]"
    --     local cand = Candidate("", seg.start, seg._end, task_type, "")
    --     cand.quality=1
    --     yield(cand)
    -- end
end

function date_translator(input, seg)

    -- 日期格式说明：

    -- %a   abbreviated weekday name (e.g., Wed)
    -- %A   full weekday name (e.g., Wednesday)
    -- %b   abbreviated month name (e.g., Sep)
    -- %B   full month name (e.g., September)
    -- %c   date and time (e.g., 09/16/98 23:48:10)
    -- %d   day of the month (16) [01-31]
    -- %H   hour, using a 24-hour clock (23) [00-23]
    -- %I   hour, using a 12-hour clock (11) [01-12]
    -- %M   minute (48) [00-59]
    -- %m   month (09) [01-12]
    -- %p   either "am" or "pm" (pm)
    -- %S   second (10) [00-61]
    -- %w   weekday (3) [0-6 = Sunday-Saturday]
    -- %W   week number in year (48) [01-52]
    -- %x   date (e.g., 09/16/98)
    -- %X   time (e.g., 23:48:10)
    -- %Y   full year (1998)
    -- %y   two-digit year (98) [00-99]
    -- %%   the character `%´

    -- 输入完整日期
    if (input == "sj") then
        local cand = Candidate("datetime", seg.start, seg._end, os.date("%Y%m%d-%H%M%S"), "")
        cand.quality = 100
        yield(cand)
        local cand2 = Candidate("datetime", seg.start, seg._end, os.date("%H:%M:%S"), "")
        cand2.quality = 101
        yield(cand2)
    end

    if (input == "ssj") then
        local cand = Candidate("datetime", seg.start, seg._end, os.date("%y%m%d-%H%M"), "")
        cand.quality = 100
        yield(cand)
    end

    -- 输入日期
    if (input == "rq") then
        --- Candidate(type, start, end, text, comment)
        yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))

        local cand = Candidate("datetime", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), "")
        cand.quality = 100
        yield(cand)
    end
end
