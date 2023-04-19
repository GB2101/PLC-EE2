math.randomseed(os.time())

pikachu = 800;
raichu = 1000;

Attack = {
	{ "Choque do trovão", 50 },
	{ "Calda de ferro", 100 },
	{ "Investida Trovão", 150 },
	{ "Trovão", 200 }
};

function GetAttack()
	number = math.floor(math.random() * 20) + 1;

	if number <= 10 then
		return Attack[1];
	elseif number <= 15 then
		return Attack[2];
	elseif number <= 18 then
		return Attack[3];
	else
		return Attack[4];
	end
end

function PrintLife()
	print("Raichu: ", raichu);
	print("Pikachu:", pikachu);
	print("-----------------");
end

function PikachuAttack()
	
	while pikachu >= 0 do
		attack = GetAttack();
		raichu = raichu - attack[2];
		print("Pikachu", attack[1]);
		PrintLife();
		coroutine.yield();
	end
end

function RaichuAttack()
	
	while raichu >= 0 do
		attack = GetAttack();
		pikachu = pikachu - attack[2];
		print("Raichu", attack[1]);
		PrintLife();
		coroutine.yield();
	end
end



pikachuRoutine = coroutine.create(PikachuAttack);
RaichuRoutine = coroutine.create(RaichuAttack);

while pikachu >= 0 and raichu >= 0 do
	coroutine.resume(pikachuRoutine);
	coroutine.resume(RaichuRoutine);
end