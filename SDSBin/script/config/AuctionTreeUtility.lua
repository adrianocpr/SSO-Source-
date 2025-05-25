---------------------------------------------------------------
--  created:   2012.8.14
--  author:    chenfudun
--
--  拍卖数据操作接口，程序修改
---------------------------------------------------------------
function auction_data:GetName(id)
    return self[id].name
end

function auction_data:GetImage(id)
    return self[id].image
end

function auction_data:GetInfo (id)
    return self[id].main, self[id].sub, self[id].leaf
end

--- 根据名称来获取对应的 auction_data
function auction_data:GetData(name)
   for _,data in ipairs(auction_data) do
       if data.name == name then
          return data
       end
   end
   return nil
end

function auction_data:GetAuctionMain(name)
    local data = self:GetData (name)
    if data then
        return data.main
    end
    return -1
end
