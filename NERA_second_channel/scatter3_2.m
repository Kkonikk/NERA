[p,m]=mcstas('NERA_guide_3x3_sample_scatter3.instr',struct('distance_before_sample',0.01:0.01:0.6),struct('ncount',1e7,'mpi',8));
scatter3(m)