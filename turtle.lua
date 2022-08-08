--Probably gonna have all the code in a turtle

--Constants
cropSticksId = 'AgriCraft:cropsItem'

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