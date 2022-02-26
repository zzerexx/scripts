-- This version may give different results!
-- The original version can be found here: https://pastebin.com/raw/0pVCCryf

----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
local bit = getrenv().bit32
local osclock = os.clock

local benchmarks = {
	{
		Name = "Array3d",
		Function = function()
			local function ArraySet(self, x, y, z, p)
				local nx = self.nx
				assert(x >= 0 and x < nx, "x outside PA")
				assert(y >= 0 and y < nx, "y outside PA")
				assert(z >= 0 and z < nx, "z outside PA")
				local pos = (z * self.ny + y) * nx + x
				local image = self.image
				if self.packed then
					local maxv = self.max_voltage
					if p > maxv then
						self.max_voltage = p * 2
					end

					local oldp = image[pos] or 0
					if oldp > maxv then
						p += maxv * 2
					end
					image[pos] = p
				else
					image[pos] = p
				end
				self.changed = true
				self.changed_recently = true
			end

			local function ArrayPoints(self)
				local y, z = 0, 0
				return function(self, x)
					x += 1
					if x >= self.nx then
						x = 0
						y += 1
						if y >= self.ny then
							y = 0
							z += 1
						end

						if z >= self.nz then
							return
						end
					end
					return x, y, z
				end, self, 0
			end

			local function ArrayNew(nx, ny, nz, packed)
				return {
					nx = nx,
					ny = ny,
					nz = nz,
					packed = packed,
					max_voltage = 0,
					changed = false,
					changed_recently = false, 
					image = {},
					set = ArraySet, 
					points = ArrayPoints
				}
			end

			local packed = true

			local function RunIterator(dim)
				local array = ArrayNew(dim, dim, dim, packed)
				for x, y, z in array:points() do
					array:set(x, y, z, x * x)
				end
				assert(array.image[dim ^ 3 - 1] == (dim - 1) ^ 2)
			end

			return RunIterator(200)
		end
	},
	{
		Name = "binarytrees",
		Function = function()
			local mindepth = 4
			local maxdepth = 12

			local function BottomUpTree(item, depth)
				if depth > 0 then
					local i = item + item 
					depth -= 1

					local left, right = BottomUpTree(i - 1, depth), BottomUpTree(i, depth)
					return {item, left, right}
				else
					return {item}
				end
			end

			local function ItemCheck(tree)
				if #tree == 3 then
					return tree[1] + ItemCheck(tree[2]) - ItemCheck(tree[3])
				else
					return tree[1]
				end
			end

			local function InnerIterator(min, max)
				local check = 0
				
				local stretchdepth = maxdepth + 1 
				local stretchtree = BottomUpTree(0, stretchdepth)
				check += ItemCheck(stretchtree)

				local tree = BottomUpTree(0, maxdepth)
				
				for depth = mindepth, maxdepth, 2 do
					local iterations = 2 ^ (maxdepth - depth + mindepth)
					for i = 1, iterations do
						check += ItemCheck(BottomUpTree(1, depth)) + ItemCheck(BottomUpTree(-1, depth))
					end
				end

				check += ItemCheck(tree)
			end

			local function RunIterator(n)
				for i = 1, n do
					InnerIterator(mindepth, maxdepth)
				end
			end

			return RunIterator(3)
		end
	},
	{
		Name = "coroutines",
		Function = function()
			local size = 503
			local threads = {}

			local create, resume, yield = coroutine.create, coroutine.resume, coroutine.yield

			local id = 1
			local token = 0 
			local ok 

			local body = function(token)
				while true do
					token = yield(token + 1)
				end
			end

			for id = 1, size do
				threads[id] = create(body)
			end

			local function RunIterator(n)
				id = 1
				token = 0

				repeat
					if id == size then
						id = 1
					else
						id += 1
					end
					ok, token = resume(threads[id], token)
				until token == n
			end

			return RunIterator(3300000)
		end
	},
	{
		Name = "euler",
		Function = function()
			local bnot, bor, band = bit.bnot, bit.bor, bit.band 
			local shl, shr = bit.lshift, bit.rshift

			local function RunIterator(n)
				local cache, m, _n = {1}, 1, 1
				for i = 2, n do
					local j = i
					for len = 1, 1000000000 do
						j = bor(band(shr(j, 1), band(j, 1) - 1), band(shl(j, 1) + j + 1, bnot(band(j, 1) - 1)))
						if cache then
							local x = cache[j]
							if x then
								j = x + len 
								break
							end
						elseif j == 1 then
							j = len + 1
							break
						end
					end
					if cache then
						cache[i] = j
					end
					if j > m then
						m, _n = j, i
					end
				end
				assert(m > 1 and _n > 1)
			end
			
			return RunIterator(3500000)
		end
	}
}
warn("[Robot Benchmarker]: Your game will freeze temporarily.")
task.wait(2)
warn("[Robot Benchmarker]: Running benchmarks...")

for _,v in next, benchmarks do
	local start = osclock()
	print("	[+]: Running benchmark '"..v.Name.."'...")

	local a = pcall(v.Function)

	if not a then
		print("	[+]: Benchmark failed, is your exploit shit?")
	else
		print("	[+]: Benchmark finished in "..(osclock() - start).."\n")
	end
end

warn("[Robot Benchmarker]: Finished all benchmarks.")
