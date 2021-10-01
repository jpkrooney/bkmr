makeKpart(r, Z1) = @tullio _[j,i] := r[μ] * (Z1[i,μ] - Z1[j,μ])^2;
makeKpart(r, Z1, Z2) = @tullio _[j,i] := r[μ] * (Z1[i,μ] - Z2[j,μ])^2;

