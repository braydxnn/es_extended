Core.Players = {}
Core.UsableItemsCallbacks = {}
Core.ServerCallbacks = {}
Core.TimeoutCount = -1
Core.CancelledTimeouts = {}
Core.Jobs = {}
Core.RegisteredCommands = {}

AddEventHandler('esx:getSharedObject', function(cb)
	cb(ESX)
end)

function getSharedObject()
	return ESX
end

RegisterNetEvent('esx:clientLog', function(msg)
	if Config.EnableDebug then
		print(('[^2TRACE^7] %s^7'):format(msg))
	end
end)

RegisterNetEvent('esx:triggerServerCallback', function(name, requestId, ...)
	local playerId = source

	ESX.TriggerServerCallback(name, requestId, playerId, function(...)
		TriggerClientEvent('esx:serverCallback', playerId, requestId, ...)
	end, ...)
end)

Core.LoadJobs = function()
	local Jobs = {}
	local file = load(LoadResourceFile('es_extended', '/data/jobs.lua'))()
	for job, data in pairs(file) do
		Jobs[job] = {name=job, label=data.label, grades=data.grades}
		for k, v in pairs(Jobs[job].grades) do
			v.job_name = job
			v.grade = k
		end
	end
	Core.Jobs = Jobs
	print('[^2INFO^7] Loaded jobs data')
end

Core.LoadJobs()

SetInterval('save', 600000, function() -- 10 minutes
	Core.SavePlayers()
end)
