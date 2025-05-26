local api = GameApi


----------------------
-- 图鉴相关操作

--require "PhotoBook"

PhotoBookMan = {}



-- 获得所有图鉴主类型的名字
function PhotoBookMan:GetMainTypeNames()
    return PhotoBook_TypeName
end


-- 获得这个主类型下，所有子类型的名字
function PhotoBookMan:GetSubTypeNames(main_type)
    local list = {}
    photobook_dir = PhotoBook_dir[PhotoBook_TypeName[main_type]]
    for k,v in ipairs(photobook_dir) do
        local sub_type = v
        for k,v in ipairs(sub_type) do
            if(k == 1 and type(v) == "string")then
            	table.insert(list,v)
        	end
    	end
    end
    return list
end

-- 获得图鉴总点数
function PhotoBookMan:GetTotalPoint()
    local total_point = 0
    for k,v in ipairs(PhotoBook_TypeName) do
        photobook_dir = PhotoBook_dir[v]
        for k,v in ipairs(photobook_dir) do
            photobook_sub_type =  v  
            for k,v in ipairs(photobook_sub_type) do
                if(k > 1) then
                    photobook_id = v
                    photobook_item = PhotoBook_item[photobook_id]
                    if(photobook_item) then
                        total_point =  total_point + photobook_item.point
            		end
            	end                
            end      
        end
    end
    return total_point
end

-- 获得我收集的图鉴所占有的点数
function PhotoBookMan:GetMyPoint()
    local my_point = 0
    for k,v in ipairs(PhotoBook_TypeName) do
        photobook_dir = PhotoBook_dir[v]
        for k,v in ipairs(photobook_dir) do
            photobook_sub_type =  v  
            for k,v in ipairs(photobook_sub_type) do
                if(k > 1) then
                    photobook_id = v
                    photobook_item = PhotoBook_item[photobook_id]
                    if(photobook_item and api.IsPhotoBookGot(photobook_id)) then
                        my_point =  my_point + photobook_item.point
            		end
            	end                
            end      
        end
    end
    return my_point
end

-- 获得图鉴总数
function PhotoBookMan:GetTotalNum()
    local total_num = 0
    for k,v in ipairs(PhotoBook_TypeName) do
        photobook_dir = PhotoBook_dir[v]
        for k,v in ipairs(photobook_dir) do
            photobook_sub_type =  v  
            for k,v in ipairs(photobook_sub_type) do
                if(k > 1) then
                    photobook_id = v
                    photobook_item = PhotoBook_item[photobook_id]
                    if(photobook_item) then
                        total_num =  total_num + 1
            		end
            	end                
            end      
        end
    end
    return total_num
end

-- 获得这个子类型下的图鉴数
function PhotoBookMan:GetNumOfThisSubType(main_type,sub_type)
    local num = 0;
    photobook_dir = PhotoBook_dir[PhotoBook_TypeName[main_type]]
    if  (photobook_dir and photobook_dir[sub_type]) then
        for k,v in ipairs(photobook_dir[sub_type]) do
            if (type(v) == "number")then
            	num = num + 1;
            end
        end
    end
    return num
end

-- 获得我已经收集到的这个子类型下的图鉴数
function PhotoBookMan:GetNumOfThisSubTypeGot(main_type,sub_type)
    local num = 0;
    photobook_dir = PhotoBook_dir[PhotoBook_TypeName[main_type]]
    if  (photobook_dir and photobook_dir[sub_type]) then
        for k,v in ipairs(photobook_dir[sub_type]) do
            if (type(v) == "number" and api.IsPhotoBookGot(v))then
            	num = num + 1;
            end
        end
    end
    return num
end

-- 获得这个主类型下的图鉴数
function PhotoBookMan:GetNumOfThisType(main_type)
    local num = 0
    photobook_dir = PhotoBook_dir[PhotoBook_TypeName[main_type]]
    if  (photobook_dir) then
        for k,v in ipairs(photobook_dir) do
            num = num + self.GetNumOfThisSubType(self,main_type,k)
        end
    end
    return num
end


-- 获得这个我收集到的这个主类型下的图鉴数
function PhotoBookMan:GetNumOfThisTypeGot(main_type)
    local num = 0;
    photobook_dir = PhotoBook_dir[PhotoBook_TypeName[main_type]]
    if  (photobook_dir) then
        for k,v in ipairs(photobook_dir) do
            num = num + self.GetNumOfThisSubTypeGot(self,main_type,k)
        end
    end
    return num
end

-- 获得这个图鉴的主类型
function PhotoBookMan:GetPhotoBookMainType(id)
    for k,v in ipairs(PhotoBook_TypeName) do
        main_type = k
        photobook_dir = PhotoBook_dir[v]
        if  (photobook_dir) then
            -- 有子类型，仅遍历子类型
            for k,v in ipairs(photobook_dir) do
                for k,v in ipairs(v) do
                    if (k > 1 and type(v) == "number")then
                    	if id == v then
                    	    return main_type
                    	end
                    end
                end 
            end
        end
    end
    return -1
end

function PhotoBookMan:GetPhotoBookItem(id)
    return PhotoBook_item[id],self.GetPhotoBookMainType(self,id)
end

function PhotoBookMan:GetPhotoBookPoint(id)
    if PhotoBook_item[id] then
		return PhotoBook_item[id].point
    else
        return 0
    end
end

function PhotoBookMan:LoadPhotoBookList(main_type,sub_type)
    local list = {}
    photobook_dir = PhotoBook_dir[PhotoBook_TypeName[main_type]]
    if  (photobook_dir) then
        -- 有子类型，仅遍历子类型
        if(type(sub_type) == "number" and sub_type > 0 and photobook_dir[sub_type])then
            for k,v in ipairs(photobook_dir[sub_type]) do
                if (k > 1 and type(v) == "number" and PhotoBook_item[v])then
                	local item_info = {}
                    item_info.id =  v
                    item_info.name = PhotoBook_item[v].name
                    item_info.point = PhotoBook_item[v].point
                    item_info.rarity = PhotoBook_item[v].rarity
                    item_info.icon_dir_small = PhotoBook_item[v].icon_dir_small
                    table.insert(list, item_info)
                end
            end
        -- 没有子类型，遍历主类型下的所有子类型
        else
            for k,v in ipairs(photobook_dir) do
                photobook_sub_type =  v
                 for k,v in ipairs(photobook_sub_type) do
                    if (k > 1 and type(v) == "number" and PhotoBook_item[v])then
                    	local item_info = {}
                        item_info.id =  v
                        item_info.name = PhotoBook_item[v].name
                        item_info.point = PhotoBook_item[v].point
                        item_info.rarity = PhotoBook_item[v].rarity
                        item_info.icon_dir_small = PhotoBook_item[v].icon_dir_small
                        table.insert(list, item_info)
                    end
                end
            end
    	end
    end
    return list
end


-- 获得收藏模板id到图鉴id的映射
function PhotoBookMan:GetCollectionToPhotobook()
    local list = {}
    for k,v in ipairs(PhotoBook_TypeName) do
        photobook_dir = PhotoBook_dir[v]
        for k,v in ipairs(photobook_dir) do
            photobook_sub_type =  v  
            for k,v in ipairs(photobook_sub_type) do
                if(k > 1) then
                    photobook_id = v
                    photobook_item = PhotoBook_item[photobook_id]
                    if(photobook_item) then
                        local map = {}
                        map.collection = photobook_item.collection_tid
                        map.photobook =  photobook_id 
                        table.insert(list, map)
            		end
            	end                
            end      
        end
    end
    return list
end
