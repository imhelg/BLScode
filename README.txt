
This repository contains the BLS toolbox. 

The implementation is based on the paper: 

    A Bayesian Lasso based Sparse Learning Model
    by Ingvild M. Helgøy and Yushu Li. 

The BLS toolbox is based on a modified version of the SPARSEBAYES library 
for Matlab (V2.0) and contains the necessary changes to translate the algorithm from RVM to BLS.
The SPARSEBAYES library implements the algorithm detailed in:
    
    Tipping, M. E. and A. C. Faul (2003). "Fast marginal likelihood
    maximisation for sparse Bayesian models." In C. M. Bishop and
    B. J. Frey (Eds.), Proceedings of the Ninth International Workshop
    on Artificial Intelligence and Statistics, Key West, FL, Jan 3-6.


The BLS toolbox includes several files, but users typically only need to
access a specific subset of them. 
The primary algorithm is contained in the file: 
	BLS.m

As an introduction to the BLS toolbox it is recommended to run the Example_Sinc.m script. 


Copyright 2023, Ingvild Helgøy


This file is part of the BLS toolbox.

BLS is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the Free
Software Foundation; either version 2 of the License, or (at your option)
any later version.

BLS is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
more details.

You should have received a copy of the GNU General Public License along
with BLS in the accompanying file "licence.txt"; if not, write to
the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
MA 02110-1301 USA
