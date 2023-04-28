mysql = exports.vrp_mysql


addEvent("anahtarcikart", true)
addEventHandler("anahtarcikart", root, function(plr,durum,id)
			if durum == 2 then -- // Ev başlangıç
				
				for key, v in ipairs(getElementsByType("interior")) do
					local owner = tonumber(getElementData(v, "status")[4])
					if tonumber(id)  == tonumber(v:getData("dbid")) then
						if (owner) and owner == tonumber(plr:getData("dbid")) then
							local isim = getElementData(v,"name")
							if not exports.vrp_global:hasSpaceForItem(plr, 4, 1) then
								outputChatBox("[!]#ffffff Envanterinizde anahtar için yeterli alan bulunmamaktadır!", plr, 255, 0, 0, true)
							return end	
							if not exports.vrp_global:takeMoney(plr, 700) then
								outputChatBox("[!]#ffffff Yeterli miktarda paranız yok.",plr,255,0,0,true)
							return end
							exports.vrp_global:giveItem(plr, 4, id)
							outputChatBox("[!]#ffffff ["..isim.."] adlı mülkünüzün anahtarını kopyaladınız.",plr,100,100,255,true)
						else
							outputChatBox("[!]#ffffff Bu mülkün sahibi değilsiniz.",plr,255,0,0,true)
						end
					end
				end
			end -- // Ev bitiş
			if durum == 1 then -- // Araç başlangıç
				for key, v in ipairs(getElementsByType("vehicle")) do
					if tonumber(id) == tonumber(v:getData("dbid")) then
						if plr:getData("dbid") == v:getData("owner") then
							if not exports.vrp_global:hasSpaceForItem(plr, 3, 1) then
								outputChatBox("[!]#ffffff Envanterinizde anahtar için yeterli alan bulunmamaktadır!", plr, 255, 0, 0, true)
							return end	
								if not exports.vrp_global:takeMoney(plr, 700) then
								outputChatBox("[!]#ffffff Yeterli miktarda paranız yok.",plr,255,0,0,true)
							return end
							exports.vrp_global:giveItem(plr, 3, id)
						outputChatBox("[!]#ffffff ["..tonumber(id).."] id li aracın anahtarını kopyaladınız.",plr,100,100,255,true)
						else
						outputChatBox("[!]#ffffff Bu aracın sahibi değilsiniz.",plr,255,0,0,true)
						end
					end
				end
			end -- // Araç bitiş
end)