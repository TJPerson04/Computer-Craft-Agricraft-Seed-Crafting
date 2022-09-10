--Probably gonna have all the code in a turtle
--Make sure all dynamism tablets are in Redstone Control

--Constants
cropSticksId = 'AgriCraft:cropsItem'
diamondHoeId = 'minecraft:diamond_hoe'

--Functions
function pickUpItemsByName(side, itemId) 
    inventorySize = peripheral.call(side, 'getInventorySize')
    for i=1, inventorySize, 1 do
        itemInfo = peripheral.call(side, 'getStackInSlot', i)
        if (itemInfo) then
            if (itemInfo ~= nil and itemInfo.id == itemId) then
                peripheral.call(side, 'swapStacks', i, 1)
                turtle.suck()
                return
            end
        end
    end

    print('No items with an id of ' .. itemId)
    return
end

function dropOffAllItems()
    for i=1, 16, 1 do
        turtle.select(i)
        turtle.drop()
    end
    turtle.select(1)
end

function selectItem(itemId)
    for i=1, 16, 1 do
        if (turtle.getItemDetail(i) ~= nil) then
            if (turtle.getItemDetail(i).name == itemId) then
                turtle.select(i)
                return true
            end
        end
    end
    return false
end

function useItemInTablet(itemId, isLeftClick)
    if (selectItem(itemId)) then
        turtle.drop()
        peripheral.call('front', 'setLeftClick', isLeftClick)
        peripheral.call('front', 'trigger')
        os.sleep(1)
        turtle.suck()  
    end
end



--Main
