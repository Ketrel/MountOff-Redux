SLASH_MOUNTOFF1 = '/mountoff'
function SlashCmdList.MOUNTOFF (args)
    if args == "help" then
        SendSystemMessage("/mountoff [help] - without parameters: mounts the same mount as the target, if available.  With the 'help' parameter: prints this message.")
        return
    end
    local id = C_MountJournal.GetMountIDs();
    for i = 1, 40 do
        local b = C_TooltipInfo.GetUnitBuff("target", i);
        if b == nil then break end
        b = b.id
        for _, v in pairs(id) do
            local x, n = C_MountJournal.GetMountInfoByID(v)
            if b == n then
                C_MountJournal.SummonByID(v)
                break
            end
        end
    end
end
