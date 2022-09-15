-- https://devforum.roblox.com/t/using-a-beam-to-model-projectile-motion/1302237
local ProjectileLib = {}

local pi = math.pi 
local sqrt = math.sqrt
local atan = math.atan
local sin = math.sin
local cos = math.cos 
local Vector3new = Vector3.new
local CFramenew = CFrame.new

-- Returns Tuple:  isInRange(boolean), lauchAngle(in Radians)
local function computeLaunchAngle(horizontalDistance, distanceY, intialSpeed, g) -- gravity must be (+)number
	local distanceTimesG = g * horizontalDistance -- Micro-optimizations
	local initialSpeedSquared = intialSpeed ^ 2
	
	local inRoot = initialSpeedSquared ^ 2 - (g * ((distanceTimesG * horizontalDistance) + (2 * distanceY * initialSpeedSquared)))
	if inRoot <= 0 then
		return false, 0.25 * pi -- Returns false as it is out of range
		-- Makes launch angle 45˚ for ranges past max Range
	end
	local root = sqrt(inRoot)
	local inATan1 = (initialSpeedSquared - root) / distanceTimesG
	local inATan2 = (initialSpeedSquared + root) / distanceTimesG
	local answerAngle1 = atan(inATan1) -- When optimal launch angle is lofted
	local answerAngle2 = atan(inATan2) -- When optimal launch angle is 'direct'
	-- You might be able to change some things and force the launch angle to be lofted at times for certain circumstance
	-- For example, shooting a basketball might require a more lofted trajectory, although EgoMoose's tutorial might be better for that
	if answerAngle1 < answerAngle2 then -- I've honestly never seen it be answer2, I can't figure out the case when it would be. I might remove it at some point
		return true, answerAngle1 -- Returns true as it is in range, same with below
	else
		return true, answerAngle2
	end
end

function ProjectileLib.ComputeLaunchVelocity(distanceVector, initialSpeed, g, allowOutOfRange) -- gravity: (+)number
	local horizontalDistanceVector = Vector3new(distanceVector.X, 0, distanceVector.Z)
	local horizontalDistance = horizontalDistanceVector.Magnitude
	
	local isInRange, launchAngle = computeLaunchAngle(horizontalDistance, distanceVector.Y, initialSpeed, g)
	if not isInRange and not allowOutOfRange then return end
	
	local horizontaldirectionUnit = horizontalDistanceVector.Unit
	local vy = sin(launchAngle)
	local xz = cos(launchAngle)
	local vx = horizontaldirectionUnit.X * xz
	local vz = horizontaldirectionUnit.Z * xz

	return Vector3new(vx * initialSpeed, vy * initialSpeed, vz * initialSpeed)
end

function ProjectileLib.ComputeLaunchVelocityBeam(distanceVector, initialSpeed, g, allowOutOfRange) -- gravity: (+)number
	local distanceY = distanceVector.Y
	local horizontalDistanceVector = Vector3new(distanceVector.X, 0, distanceVector.Z)
	local horizontalDistance = horizontalDistanceVector.Magnitude
	
	local isInRange, launchAngle = computeLaunchAngle(horizontalDistance, distanceY, initialSpeed, g)
	if not isInRange and not allowOutOfRange then return end
	
	local horizontaldirectionUnit = horizontalDistanceVector.Unit
	local vy = sin(launchAngle)
	local xz = cos(launchAngle)
	local vx = horizontaldirectionUnit.X * xz
	local vz = horizontaldirectionUnit.Z * xz
	
	-- Just for beaming:
	local v0sin = vy * initialSpeed
	local horizontalRangeHalf = ((initialSpeed ^ 2) / g * (sin(2 * launchAngle))) / 2
	
	local flightTime
	if horizontalRangeHalf <= horizontalDistance then
		flightTime = ((v0sin + (sqrt(v0sin ^ 2 + (2 * -g * ((distanceY)))))) / g)
	else		  
		flightTime = ((v0sin - (sqrt(v0sin ^ 2 + (2 * -g * ((distanceY)))))) / g)
	end
	--
	
	return Vector3new(vx * initialSpeed, vy * initialSpeed, vz * initialSpeed), flightTime -- flightTime is used to beam
end

-- v0: initialVelocity(Vec3),   x0: initialPosition(Vec3),   t1: flightTime((+)number),   g: gravity((+)number)
function ProjectileLib.BeamProjectile(v0, x0, t1, g)
	local g = Vector3new(0, -g, 0)
	-- calculate the bezier points
	local c = 0.125
	local p3 = 0.5 * g * t1 * t1 + v0 * t1 + x0
	local p2 = p3 - (g * t1 * t1 + v0 * t1) / 3
	local p1 = (c * g * t1 * t1 + 0.5 * v0 * t1 + x0 - c * (x0 + p3)) / (3 * c) - p2
 
	-- the curve sizes
	local curve0 = (p1 - x0).magnitude
	local curve1 = (p2 - p3).magnitude
 
	-- build the world CFrames for the attachments
	local b = (x0 - p3).unit
	local r1 = (p1 - x0).unit
	local u1 = r1:Cross(b).unit
	local r2 = (p2 - p3).unit
	local u2 = r2:Cross(b).unit
	b = u1:Cross(r1).unit
 
	local cf0 = CFramenew(
		(x0.x), (x0.y), (x0.z),
		r1.x, u1.x, b.x,
		r1.y, u1.y, b.y,
		r1.z, u1.z, b.z)
 
	local cf1 = CFramenew(
		(p3.x), (p3.y), (p3.z),
		r2.x, u2.x, b.x,
		r2.y, u2.y, b.y,
		r2.z, u2.z, b.z)
 
	return curve0, -curve1, cf0, cf1
end

return ProjectileLib
