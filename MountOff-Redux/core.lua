SLASH_MOUNTOFF1 = '/mountoff'
function SlashCmdList.MOUNTOFF (args)
    if args == "help" then
        SendSystemMessage("/mountoff [help] - without parameters: mounts the same mount as the target, if available.  With the 'help' parameter: prints this message.")
        return
    end

    if UnitIsPlayer("target") or (UnitGUID("target") ~= nil and (select(6,strsplit('-', UnitGUID("target")))) == '224220') then
        local buff = nil
        local mount = nil
        for i = 1,40 do
            buff = C_TooltipInfo.GetUnitBuff("target",i)
            if buff and buff.id then
                mount = C_MountJournal.GetMountFromSpell(buff.id)
                if mount then
                    if C_MountJournal.GetMountUsabilityByID(mount, true) then
                        C_MountJournal.SummonByID(mount)
                        break
                    elseif C_MountJournal.GetMountUsabilityByID(mount, false) then
                        print("You can ride the same mount as your target... if you go outside.")
                        break
                    else
                        mountName,_,_,_,_,_,_,_,_,_,_,_ = C_MountJournal.GetMountInfoByID(mount)
                        print("Target is riding a mount you cannot use: "..mountName.."")
                        break
                    end
                end
            end
        end
    end
end
