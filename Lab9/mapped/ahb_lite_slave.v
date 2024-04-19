/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Mar 27 23:12:52 2024
/////////////////////////////////////////////////////////////


module ahb_lite_slave ( clk, n_rst, sample_data, data_ready, 
        new_coefficient_set, coefficient_num, fir_coefficient, 
        clear_new_coefficient, modwait, fir_out, err, hsel, haddr, hsize, 
        htrans, hwrite, hwdata, hrdata, hresp );
  output [15:0] sample_data;
  input [1:0] coefficient_num;
  output [15:0] fir_coefficient;
  input [15:0] fir_out;
  input [3:0] haddr;
  input [1:0] htrans;
  input [15:0] hwdata;
  output [15:0] hrdata;
  input clk, n_rst, clear_new_coefficient, modwait, err, hsel, hsize, hwrite;
  output data_ready, new_coefficient_set, hresp;
  wire   next_new_coefficient_set, next_data_ready, N214, prev_hsel,
         prev_hwrite, prev_hsize, N276, N277, N278, N279, N280, N281, N282,
         N283, N284, N285, N286, N287, N288, N289, N290, N291, N292, N293,
         N294, N295, N296, N297, N298, N299, N300, N301, N302, N303, N304,
         N305, N306, N307, N308, N309, N310, N311, N312, N313, N314, N315,
         N316, N317, N318, N319, N320, N321, N322, N323, N324, N325, N326,
         N327, N328, N329, N330, N331, N332, N333, N334, N335, N336, N337,
         N338, N339, N340, N341, N342, N343, N344, N345, N346, N347, N348,
         N349, N350, N351, N352, N353, N354, N355, N356, N357, N739, n1932,
         n1933, n1934, n1935, n1936, n1937, n1938, n1939, n1940, n1941, n1942,
         n1943, n1944, n1945, n1946, n1947, n1948, n1949, n1950, n1951, n1952,
         n1953, n1954, n1955, n1956, n1957, n1958, n1959, n1960, n1961, n1962,
         n1963, n1964, n1965, n1966, n1967, n1968, n1969, n1970, n1971, n1972,
         n1973, n1974, n1975, n1976, n1977, n1978, n1979, n1980, n1981, n1982,
         n1983, n1984, n1985, n1986, n1987, n1988, n1989, n1990, n1991, n1992,
         n1993, n1994, n1995, n1996, n1997, n1998, n1999, n2000, n2001, n2002,
         n2003, n2004, n2005, n2006, n2007, n2008, n2009, n2010, n2011, n2012,
         n2013, n2014, n2015, n2016, n2017, n2018, n2019, n2020, n2021, n2022,
         n2023, n2024, n2025, n2026, n2027, n2028, n2029, n2030, n2031, n2032,
         n2033, n2034, n2035, n2036, n2037, n2038, n2039, n2040, n2041, n2042,
         n2043, n2044, n2045, n2046, n2047, n2048, n2049, n2050, n2051, n2052,
         n2053, n2054, n2055, n2056, n2057, n2058, n2059, n2060, n2061, n2062,
         n2063, n2064, n2065, n2066, n2067, n2068, n2069, n2070, n2071, n2072,
         n2073, n2074, n2075, n2076, n2077, n2078, n2079, n2080, n2081, n2082,
         n2083, n2084, n2085, n2086, n2087, n2088, n2089, n2090, n2091, n2092,
         n2093, n2094, n2095, n2096, n2097, n2098, n2099, n2100, n2101, n2102,
         n2103, n2104, n2105, n2106, n2107, n2108, n2109, n2110, n2111, n2112,
         n2113, n2114, n2115, n2116, n2117, n2118, n2119, n2120, n2121, n2122,
         n2123, n2124, n2125, n2126, n2127, n2128, n2129, n2130, n2131, n2132,
         n2133, n2134, n2135, n2136, n2137, n2138, n2139, n2140, n2141, n2142,
         n2143, n2144, n2145, n2146, n2147, n2148, n2149, n2150, n2151, n2152,
         n2153, n2154, n2155, n2156, n2157, n2158, n2159, n2160, n2161, n2162,
         n2163, n2164, n2165, n2166, n2167, n2168, n2169, n2170, n2171, n2172,
         n2173, n2174, n2175, n2176, n2177, n2178, n2179, n2180, n2181, n2182,
         n2183, n2184, n2185, n2186, n2187, n2188, n2189, n2190, n2191, n2192,
         n2193, n2194, n2195, n2196, n2197, n2198, n2199, n2200, n2201, n2202,
         n2203, n2204, n2205, n2206, n2207, n2208, n2209, n2210, n2211, n2212,
         n2213, n2214, n2215, n2216, n2217, n2218, n2219, n2220, n2221, n2222,
         n2223, n2224, n2225, n2226, n2227, n2228, n2229, n2230, n2231, n2232,
         n2233, n2234, n2235, n2236, n2237, n2238, n2239, n2240, n2241, n2242,
         n2243, n2244, n2245, n2246, n2247, n2248, n2249, n2250, n2251, n2252,
         n2253, n2254, n2255, n2256, n2257, n2258, n2259, n2260, n2261, n2262,
         n2263, n2264, n2265, n2266, n2267, n2268, n2269, n2270, n2271, n2272,
         n2273, n2274, n2275, n2276, n2277, n2278, n2279, n2280, n2281, n2282,
         n2283, n2284, n2285, n2286, n2287, n2288, n2289, n2290, n2291, n2292,
         n2293, n2294, n2295, n2296, n2297, n2298, n2299, n2300, n2301, n2302,
         n2303, n2304, n2305, n2306, n2307, n2308, n2309, n2310, n2311, n2312,
         n2313, n2314, n2315, n2316, n2317, n2318, n2319, n2320, n2321, n2322,
         n2323, n2324, n2325, n2326, n2327, n2328, n2329, n2330, n2331, n2332,
         n2333, n2334, n2335, n2336, n2337, n2338, n2339, n2340, n2341, n2342,
         n2343, n2344, n2345, n2346, n2347, n2348, n2349, n2350, n2351, n2352,
         n2353, n2354, n2355, n2356, n2357, n2358, n2359, n2360, n2361, n2362,
         n2363, n2364, n2365, n2366, n2367, n2368, n2369, n2370, n2371, n2372,
         n2373, n2374, n2375, n2376, n2377, n2378, n2379, n2380, n2381, n2382,
         n2383, n2384, n2385, n2386, n2387, n2388, n2389, n2390, n2391, n2392,
         n2393, n2394, n2395, n2396, n2397, n2398, n2399, n2400, n2401, n2402,
         n2403, n2404, n2405, n2406, n2407, n2408, n2409, n2410, n2411, n2412,
         n2413, n2414, n2415, n2416, n2417, n2418, n2419, n2420, n2421, n2422,
         n2423, n2424, n2425, n2426, n2427, n2428, n2429, n2430, n2431, n2432,
         n2433, n2434, n2435, n2436, n2437, n2438, n2439, n2440, n2441, n2442,
         n2443, n2444, n2445, n2446, n2447, n2448, n2449, n2450, n2451, n2452,
         n2453, n2454, n2455, n2456, n2457, n2458, n2459, n2460, n2461, n2462,
         n2463, n2464, n2465, n2466, n2467, n2468, n2469, n2470, n2471, n2472,
         n2473, n2474, n2475, n2476, n2477, n2478, n2479, n2480, n2481, n2482,
         n2483, n2484, n2485, n2486, n2487, n2488, n2489, n2490, n2491, n2492,
         n2493, n2494, n2495, n2496, n2497, n2498, n2499, n2500, n2501, n2502,
         n2503, n2504, n2505, n2506, n2507, n2508, n2509, n2510, n2511, n2512,
         n2513, n2514, n2515, n2516, n2517, n2518, n2519, n2520, n2521, n2522,
         n2523, n2524, n2525, n2526, n2527, n2528, n2529, n2530, n2531, n2532,
         n2533, n2534, n2535, n2536, n2537, n2538, n2539, n2540, n2541, n2542,
         n2543, n2544, n2545, n2546, n2547, n2548, n2549, n2550, n2551, n2552;
  wire   [15:0] next_hrdata;
  wire   [15:0] next_sample_data;
  wire   [15:0] next_fir_coefficient0;
  wire   [15:0] next_fir_coefficient1;
  wire   [15:0] next_fir_coefficient2;
  wire   [15:0] next_fir_coefficient3;
  wire   [15:0] fir_coefficient0;
  wire   [15:0] fir_coefficient1;
  wire   [15:0] fir_coefficient2;
  wire   [15:0] fir_coefficient3;
  wire   [1:0] prev_htrans;
  wire   [3:0] prev_haddr;
  assign hresp = N739;

  DFFSR \prev_haddr_reg[3]  ( .D(haddr[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prev_haddr[3]) );
  DFFSR \prev_haddr_reg[2]  ( .D(haddr[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prev_haddr[2]) );
  DFFSR \prev_haddr_reg[1]  ( .D(haddr[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prev_haddr[1]) );
  DFFSR \prev_haddr_reg[0]  ( .D(haddr[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prev_haddr[0]) );
  DFFSR prev_hsize_reg ( .D(hsize), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prev_hsize) );
  DFFSR prev_hsel_reg ( .D(hsel), .CLK(clk), .R(n_rst), .S(1'b1), .Q(prev_hsel) );
  DFFSR \prev_htrans_reg[1]  ( .D(htrans[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prev_htrans[1]) );
  DFFSR \prev_htrans_reg[0]  ( .D(htrans[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prev_htrans[0]) );
  DFFSR prev_hwrite_reg ( .D(hwrite), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prev_hwrite) );
  DFFSR data_ready_reg ( .D(next_data_ready), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_ready) );
  DFFSR \sample_data_reg[15]  ( .D(next_sample_data[15]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[15]) );
  DFFSR \sample_data_reg[14]  ( .D(next_sample_data[14]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[14]) );
  DFFSR \sample_data_reg[13]  ( .D(next_sample_data[13]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[13]) );
  DFFSR \sample_data_reg[12]  ( .D(next_sample_data[12]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[12]) );
  DFFSR \sample_data_reg[11]  ( .D(next_sample_data[11]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[11]) );
  DFFSR \sample_data_reg[10]  ( .D(next_sample_data[10]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[10]) );
  DFFSR \sample_data_reg[9]  ( .D(next_sample_data[9]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[9]) );
  DFFSR \sample_data_reg[8]  ( .D(next_sample_data[8]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[8]) );
  DFFSR \sample_data_reg[7]  ( .D(next_sample_data[7]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[7]) );
  DFFSR \sample_data_reg[6]  ( .D(next_sample_data[6]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[6]) );
  DFFSR \sample_data_reg[5]  ( .D(next_sample_data[5]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[5]) );
  DFFSR \sample_data_reg[4]  ( .D(next_sample_data[4]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[4]) );
  DFFSR \sample_data_reg[3]  ( .D(next_sample_data[3]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[3]) );
  DFFSR \sample_data_reg[2]  ( .D(next_sample_data[2]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[2]) );
  DFFSR \sample_data_reg[1]  ( .D(next_sample_data[1]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[1]) );
  DFFSR \sample_data_reg[0]  ( .D(next_sample_data[0]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(sample_data[0]) );
  DFFSR \fir_coefficient0_reg[15]  ( .D(next_fir_coefficient0[15]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[15]) );
  DFFSR \fir_coefficient0_reg[14]  ( .D(next_fir_coefficient0[14]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[14]) );
  DFFSR \fir_coefficient0_reg[13]  ( .D(next_fir_coefficient0[13]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[13]) );
  DFFSR \fir_coefficient0_reg[12]  ( .D(next_fir_coefficient0[12]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[12]) );
  DFFSR \fir_coefficient0_reg[11]  ( .D(next_fir_coefficient0[11]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[11]) );
  DFFSR \fir_coefficient0_reg[10]  ( .D(next_fir_coefficient0[10]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[10]) );
  DFFSR \fir_coefficient0_reg[9]  ( .D(next_fir_coefficient0[9]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[9]) );
  DFFSR \fir_coefficient0_reg[8]  ( .D(next_fir_coefficient0[8]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[8]) );
  DFFSR \fir_coefficient0_reg[7]  ( .D(next_fir_coefficient0[7]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[7]) );
  DFFSR \fir_coefficient0_reg[6]  ( .D(next_fir_coefficient0[6]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[6]) );
  DFFSR \fir_coefficient0_reg[5]  ( .D(next_fir_coefficient0[5]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[5]) );
  DFFSR \fir_coefficient0_reg[4]  ( .D(next_fir_coefficient0[4]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[4]) );
  DFFSR \fir_coefficient0_reg[3]  ( .D(next_fir_coefficient0[3]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[3]) );
  DFFSR \fir_coefficient0_reg[2]  ( .D(next_fir_coefficient0[2]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[2]) );
  DFFSR \fir_coefficient0_reg[1]  ( .D(next_fir_coefficient0[1]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[1]) );
  DFFSR \fir_coefficient0_reg[0]  ( .D(next_fir_coefficient0[0]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient0[0]) );
  DFFSR \fir_coefficient1_reg[15]  ( .D(next_fir_coefficient1[15]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[15]) );
  DFFSR \fir_coefficient1_reg[14]  ( .D(next_fir_coefficient1[14]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[14]) );
  DFFSR \fir_coefficient1_reg[13]  ( .D(next_fir_coefficient1[13]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[13]) );
  DFFSR \fir_coefficient1_reg[12]  ( .D(next_fir_coefficient1[12]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[12]) );
  DFFSR \fir_coefficient1_reg[11]  ( .D(next_fir_coefficient1[11]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[11]) );
  DFFSR \fir_coefficient1_reg[10]  ( .D(next_fir_coefficient1[10]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[10]) );
  DFFSR \fir_coefficient1_reg[9]  ( .D(next_fir_coefficient1[9]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[9]) );
  DFFSR \fir_coefficient1_reg[8]  ( .D(next_fir_coefficient1[8]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[8]) );
  DFFSR \fir_coefficient1_reg[7]  ( .D(next_fir_coefficient1[7]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[7]) );
  DFFSR \fir_coefficient1_reg[6]  ( .D(next_fir_coefficient1[6]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[6]) );
  DFFSR \fir_coefficient1_reg[5]  ( .D(next_fir_coefficient1[5]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[5]) );
  DFFSR \fir_coefficient1_reg[4]  ( .D(next_fir_coefficient1[4]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[4]) );
  DFFSR \fir_coefficient1_reg[3]  ( .D(next_fir_coefficient1[3]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[3]) );
  DFFSR \fir_coefficient1_reg[2]  ( .D(next_fir_coefficient1[2]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[2]) );
  DFFSR \fir_coefficient1_reg[1]  ( .D(next_fir_coefficient1[1]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[1]) );
  DFFSR \fir_coefficient1_reg[0]  ( .D(next_fir_coefficient1[0]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient1[0]) );
  DFFSR \fir_coefficient2_reg[15]  ( .D(next_fir_coefficient2[15]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[15]) );
  DFFSR \fir_coefficient2_reg[14]  ( .D(next_fir_coefficient2[14]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[14]) );
  DFFSR \fir_coefficient2_reg[13]  ( .D(next_fir_coefficient2[13]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[13]) );
  DFFSR \fir_coefficient2_reg[12]  ( .D(next_fir_coefficient2[12]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[12]) );
  DFFSR \fir_coefficient2_reg[11]  ( .D(next_fir_coefficient2[11]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[11]) );
  DFFSR \fir_coefficient2_reg[10]  ( .D(next_fir_coefficient2[10]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[10]) );
  DFFSR \fir_coefficient2_reg[9]  ( .D(next_fir_coefficient2[9]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[9]) );
  DFFSR \fir_coefficient2_reg[8]  ( .D(next_fir_coefficient2[8]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[8]) );
  DFFSR \fir_coefficient2_reg[7]  ( .D(next_fir_coefficient2[7]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[7]) );
  DFFSR \fir_coefficient2_reg[6]  ( .D(next_fir_coefficient2[6]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[6]) );
  DFFSR \fir_coefficient2_reg[5]  ( .D(next_fir_coefficient2[5]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[5]) );
  DFFSR \fir_coefficient2_reg[4]  ( .D(next_fir_coefficient2[4]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[4]) );
  DFFSR \fir_coefficient2_reg[3]  ( .D(next_fir_coefficient2[3]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[3]) );
  DFFSR \fir_coefficient2_reg[2]  ( .D(next_fir_coefficient2[2]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[2]) );
  DFFSR \fir_coefficient2_reg[1]  ( .D(next_fir_coefficient2[1]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[1]) );
  DFFSR \fir_coefficient2_reg[0]  ( .D(next_fir_coefficient2[0]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient2[0]) );
  DFFSR \fir_coefficient3_reg[15]  ( .D(next_fir_coefficient3[15]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[15]) );
  DFFSR \fir_coefficient3_reg[14]  ( .D(next_fir_coefficient3[14]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[14]) );
  DFFSR \fir_coefficient3_reg[13]  ( .D(next_fir_coefficient3[13]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[13]) );
  DFFSR \fir_coefficient3_reg[12]  ( .D(next_fir_coefficient3[12]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[12]) );
  DFFSR \fir_coefficient3_reg[11]  ( .D(next_fir_coefficient3[11]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[11]) );
  DFFSR \fir_coefficient3_reg[10]  ( .D(next_fir_coefficient3[10]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[10]) );
  DFFSR \fir_coefficient3_reg[9]  ( .D(next_fir_coefficient3[9]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[9]) );
  DFFSR \fir_coefficient3_reg[8]  ( .D(next_fir_coefficient3[8]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[8]) );
  DFFSR \fir_coefficient3_reg[7]  ( .D(next_fir_coefficient3[7]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[7]) );
  DFFSR \fir_coefficient3_reg[6]  ( .D(next_fir_coefficient3[6]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[6]) );
  DFFSR \fir_coefficient3_reg[5]  ( .D(next_fir_coefficient3[5]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[5]) );
  DFFSR \fir_coefficient3_reg[4]  ( .D(next_fir_coefficient3[4]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[4]) );
  DFFSR \fir_coefficient3_reg[3]  ( .D(next_fir_coefficient3[3]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[3]) );
  DFFSR \fir_coefficient3_reg[2]  ( .D(next_fir_coefficient3[2]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[2]) );
  DFFSR \fir_coefficient3_reg[1]  ( .D(next_fir_coefficient3[1]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[1]) );
  DFFSR \fir_coefficient3_reg[0]  ( .D(next_fir_coefficient3[0]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(fir_coefficient3[0]) );
  DFFSR new_coefficient_set_reg ( .D(next_new_coefficient_set), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(new_coefficient_set) );
  DFFSR \hrdata_reg[15]  ( .D(next_hrdata[15]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[15]) );
  DFFSR \hrdata_reg[14]  ( .D(next_hrdata[14]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[14]) );
  DFFSR \hrdata_reg[13]  ( .D(next_hrdata[13]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[13]) );
  DFFSR \hrdata_reg[12]  ( .D(next_hrdata[12]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[12]) );
  DFFSR \hrdata_reg[11]  ( .D(next_hrdata[11]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[11]) );
  DFFSR \hrdata_reg[10]  ( .D(next_hrdata[10]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[10]) );
  DFFSR \hrdata_reg[9]  ( .D(next_hrdata[9]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[9]) );
  DFFSR \hrdata_reg[8]  ( .D(next_hrdata[8]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[8]) );
  DFFSR \hrdata_reg[7]  ( .D(next_hrdata[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[7]) );
  DFFSR \hrdata_reg[6]  ( .D(next_hrdata[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[6]) );
  DFFSR \hrdata_reg[5]  ( .D(next_hrdata[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[5]) );
  DFFSR \hrdata_reg[4]  ( .D(next_hrdata[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[4]) );
  DFFSR \hrdata_reg[3]  ( .D(next_hrdata[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[3]) );
  DFFSR \hrdata_reg[2]  ( .D(next_hrdata[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[2]) );
  DFFSR \hrdata_reg[1]  ( .D(next_hrdata[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[1]) );
  DFFSR \hrdata_reg[0]  ( .D(next_hrdata[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(hrdata[0]) );
  BUFX2 U2051 ( .A(n2450), .Y(n1932) );
  BUFX2 U2052 ( .A(n2449), .Y(n1933) );
  BUFX2 U2053 ( .A(n2036), .Y(n1934) );
  BUFX2 U2054 ( .A(n2376), .Y(n1935) );
  BUFX2 U2055 ( .A(n2411), .Y(n1936) );
  BUFX2 U2056 ( .A(n2017), .Y(n1937) );
  BUFX2 U2057 ( .A(n2412), .Y(n1938) );
  AND2X2 U2058 ( .A(coefficient_num[1]), .B(n2534), .Y(n2500) );
  BUFX2 U2059 ( .A(n2375), .Y(n1939) );
  BUFX2 U2060 ( .A(n2026), .Y(n1940) );
  BUFX2 U2061 ( .A(n1998), .Y(n1941) );
  AND2X2 U2062 ( .A(coefficient_num[0]), .B(coefficient_num[1]), .Y(n2501) );
  AND2X2 U2063 ( .A(n2314), .B(n2487), .Y(n2112) );
  BUFX2 U2064 ( .A(n2335), .Y(n1942) );
  BUFX2 U2065 ( .A(n1989), .Y(n1943) );
  BUFX2 U2066 ( .A(n2336), .Y(n1944) );
  BUFX2 U2067 ( .A(n2502), .Y(n1945) );
  BUFX2 U2068 ( .A(n2115), .Y(n1946) );
  BUFX2 U2069 ( .A(n1980), .Y(n1947) );
  BUFX2 U2070 ( .A(n1971), .Y(n1948) );
  BUFX2 U2071 ( .A(n2503), .Y(n1949) );
  INVX2 U2072 ( .A(n2332), .Y(n1950) );
  INVX8 U2073 ( .A(n2116), .Y(n2332) );
  NAND3X1 U2074 ( .A(prev_haddr[3]), .B(n2048), .C(prev_haddr[2]), .Y(n1951)
         );
  NAND2X1 U2075 ( .A(prev_haddr[1]), .B(n2049), .Y(n1953) );
  NAND2X1 U2076 ( .A(N214), .B(n1953), .Y(n1952) );
  OAI21X1 U2077 ( .A(n1953), .B(n2552), .C(n1952), .Y(N357) );
  NAND2X1 U2078 ( .A(n2490), .B(n2049), .Y(n1962) );
  NAND2X1 U2079 ( .A(fir_coefficient3[0]), .B(n1962), .Y(n1954) );
  OAI21X1 U2080 ( .A(n1962), .B(n2552), .C(n1954), .Y(N341) );
  NAND2X1 U2081 ( .A(fir_coefficient3[1]), .B(n1962), .Y(n1955) );
  OAI21X1 U2082 ( .A(n1962), .B(n2551), .C(n1955), .Y(N342) );
  NAND2X1 U2083 ( .A(fir_coefficient3[2]), .B(n1962), .Y(n1956) );
  OAI21X1 U2084 ( .A(n1962), .B(n2550), .C(n1956), .Y(N343) );
  NAND2X1 U2085 ( .A(fir_coefficient3[3]), .B(n1962), .Y(n1957) );
  OAI21X1 U2086 ( .A(n1962), .B(n2549), .C(n1957), .Y(N344) );
  NAND2X1 U2087 ( .A(fir_coefficient3[4]), .B(n1962), .Y(n1958) );
  OAI21X1 U2088 ( .A(n1962), .B(n2548), .C(n1958), .Y(N345) );
  NAND2X1 U2089 ( .A(fir_coefficient3[5]), .B(n1962), .Y(n1959) );
  OAI21X1 U2090 ( .A(n1962), .B(n2547), .C(n1959), .Y(N346) );
  NAND2X1 U2091 ( .A(fir_coefficient3[6]), .B(n1962), .Y(n1960) );
  OAI21X1 U2092 ( .A(n1962), .B(n2546), .C(n1960), .Y(N347) );
  NAND2X1 U2093 ( .A(fir_coefficient3[7]), .B(n1962), .Y(n1961) );
  OAI21X1 U2094 ( .A(n1962), .B(n2545), .C(n1961), .Y(N348) );
  NOR2X1 U2095 ( .A(n2048), .B(prev_haddr[1]), .Y(n2037) );
  NAND3X1 U2096 ( .A(prev_haddr[3]), .B(n2037), .C(prev_haddr[2]), .Y(n1971)
         );
  NAND2X1 U2097 ( .A(fir_coefficient3[8]), .B(n1948), .Y(n1963) );
  OAI21X1 U2098 ( .A(n1948), .B(n2544), .C(n1963), .Y(N349) );
  NAND2X1 U2099 ( .A(fir_coefficient3[9]), .B(n1948), .Y(n1964) );
  OAI21X1 U2100 ( .A(n1948), .B(n2543), .C(n1964), .Y(N350) );
  NAND2X1 U2101 ( .A(fir_coefficient3[10]), .B(n1948), .Y(n1965) );
  OAI21X1 U2102 ( .A(n1948), .B(n2542), .C(n1965), .Y(N351) );
  NAND2X1 U2103 ( .A(fir_coefficient3[11]), .B(n1948), .Y(n1966) );
  OAI21X1 U2104 ( .A(n1948), .B(n2541), .C(n1966), .Y(N352) );
  NAND2X1 U2105 ( .A(fir_coefficient3[12]), .B(n1948), .Y(n1967) );
  OAI21X1 U2106 ( .A(n1948), .B(n2540), .C(n1967), .Y(N353) );
  NAND2X1 U2107 ( .A(fir_coefficient3[13]), .B(n1948), .Y(n1968) );
  OAI21X1 U2108 ( .A(n1948), .B(n2539), .C(n1968), .Y(N354) );
  NAND2X1 U2109 ( .A(fir_coefficient3[14]), .B(n1948), .Y(n1969) );
  OAI21X1 U2110 ( .A(n1948), .B(n2538), .C(n1969), .Y(N355) );
  NAND2X1 U2111 ( .A(fir_coefficient3[15]), .B(n1948), .Y(n1970) );
  OAI21X1 U2112 ( .A(n1948), .B(n2537), .C(n1970), .Y(N356) );
  AND2X1 U2113 ( .A(n2494), .B(prev_haddr[3]), .Y(n1999) );
  NAND3X1 U2114 ( .A(prev_haddr[1]), .B(n1999), .C(n2048), .Y(n1980) );
  NAND2X1 U2115 ( .A(fir_coefficient2[0]), .B(n1947), .Y(n1972) );
  OAI21X1 U2116 ( .A(n1947), .B(n2552), .C(n1972), .Y(N325) );
  NAND2X1 U2117 ( .A(fir_coefficient2[1]), .B(n1947), .Y(n1973) );
  OAI21X1 U2118 ( .A(n1947), .B(n2551), .C(n1973), .Y(N326) );
  NAND2X1 U2119 ( .A(fir_coefficient2[2]), .B(n1947), .Y(n1974) );
  OAI21X1 U2120 ( .A(n1947), .B(n2550), .C(n1974), .Y(N327) );
  NAND2X1 U2121 ( .A(fir_coefficient2[3]), .B(n1947), .Y(n1975) );
  OAI21X1 U2122 ( .A(n1947), .B(n2549), .C(n1975), .Y(N328) );
  NAND2X1 U2123 ( .A(fir_coefficient2[4]), .B(n1947), .Y(n1976) );
  OAI21X1 U2124 ( .A(n1947), .B(n2548), .C(n1976), .Y(N329) );
  NAND2X1 U2125 ( .A(fir_coefficient2[5]), .B(n1947), .Y(n1977) );
  OAI21X1 U2126 ( .A(n1947), .B(n2547), .C(n1977), .Y(N330) );
  NAND2X1 U2127 ( .A(fir_coefficient2[6]), .B(n1947), .Y(n1978) );
  OAI21X1 U2128 ( .A(n1947), .B(n2546), .C(n1978), .Y(N331) );
  NAND2X1 U2129 ( .A(fir_coefficient2[7]), .B(n1947), .Y(n1979) );
  OAI21X1 U2130 ( .A(n1947), .B(n2545), .C(n1979), .Y(N332) );
  NAND3X1 U2131 ( .A(prev_haddr[1]), .B(n1999), .C(prev_haddr[0]), .Y(n1989)
         );
  NAND2X1 U2132 ( .A(fir_coefficient2[8]), .B(n1943), .Y(n1981) );
  OAI21X1 U2133 ( .A(n1943), .B(n2544), .C(n1981), .Y(N333) );
  NAND2X1 U2134 ( .A(fir_coefficient2[9]), .B(n1943), .Y(n1982) );
  OAI21X1 U2135 ( .A(n1943), .B(n2543), .C(n1982), .Y(N334) );
  NAND2X1 U2136 ( .A(fir_coefficient2[10]), .B(n1943), .Y(n1983) );
  OAI21X1 U2137 ( .A(n1943), .B(n2542), .C(n1983), .Y(N335) );
  NAND2X1 U2138 ( .A(fir_coefficient2[11]), .B(n1943), .Y(n1984) );
  OAI21X1 U2139 ( .A(n1943), .B(n2541), .C(n1984), .Y(N336) );
  NAND2X1 U2140 ( .A(fir_coefficient2[12]), .B(n1943), .Y(n1985) );
  OAI21X1 U2141 ( .A(n1943), .B(n2540), .C(n1985), .Y(N337) );
  NAND2X1 U2142 ( .A(fir_coefficient2[13]), .B(n1943), .Y(n1986) );
  OAI21X1 U2143 ( .A(n1943), .B(n2539), .C(n1986), .Y(N338) );
  NAND2X1 U2144 ( .A(fir_coefficient2[14]), .B(n1943), .Y(n1987) );
  OAI21X1 U2145 ( .A(n1943), .B(n2538), .C(n1987), .Y(N339) );
  NAND2X1 U2146 ( .A(fir_coefficient2[15]), .B(n1943), .Y(n1988) );
  OAI21X1 U2147 ( .A(n1943), .B(n2537), .C(n1988), .Y(N340) );
  NAND3X1 U2148 ( .A(n1999), .B(n2490), .C(n2048), .Y(n1998) );
  NAND2X1 U2149 ( .A(fir_coefficient1[0]), .B(n1941), .Y(n1990) );
  OAI21X1 U2150 ( .A(n1941), .B(n2552), .C(n1990), .Y(N309) );
  NAND2X1 U2151 ( .A(fir_coefficient1[1]), .B(n1941), .Y(n1991) );
  OAI21X1 U2152 ( .A(n1941), .B(n2551), .C(n1991), .Y(N310) );
  NAND2X1 U2153 ( .A(fir_coefficient1[2]), .B(n1941), .Y(n1992) );
  OAI21X1 U2154 ( .A(n1941), .B(n2550), .C(n1992), .Y(N311) );
  NAND2X1 U2155 ( .A(fir_coefficient1[3]), .B(n1941), .Y(n1993) );
  OAI21X1 U2156 ( .A(n1941), .B(n2549), .C(n1993), .Y(N312) );
  NAND2X1 U2157 ( .A(fir_coefficient1[4]), .B(n1941), .Y(n1994) );
  OAI21X1 U2158 ( .A(n1941), .B(n2548), .C(n1994), .Y(N313) );
  NAND2X1 U2159 ( .A(fir_coefficient1[5]), .B(n1941), .Y(n1995) );
  OAI21X1 U2160 ( .A(n1941), .B(n2547), .C(n1995), .Y(N314) );
  NAND2X1 U2161 ( .A(fir_coefficient1[6]), .B(n1941), .Y(n1996) );
  OAI21X1 U2162 ( .A(n1941), .B(n2546), .C(n1996), .Y(N315) );
  NAND2X1 U2163 ( .A(fir_coefficient1[7]), .B(n1941), .Y(n1997) );
  OAI21X1 U2164 ( .A(n1941), .B(n2545), .C(n1997), .Y(N316) );
  NAND2X1 U2165 ( .A(n1999), .B(n2037), .Y(n2008) );
  NAND2X1 U2166 ( .A(fir_coefficient1[8]), .B(n2008), .Y(n2000) );
  OAI21X1 U2167 ( .A(n2008), .B(n2544), .C(n2000), .Y(N317) );
  NAND2X1 U2168 ( .A(fir_coefficient1[9]), .B(n2008), .Y(n2001) );
  OAI21X1 U2169 ( .A(n2008), .B(n2543), .C(n2001), .Y(N318) );
  NAND2X1 U2170 ( .A(fir_coefficient1[10]), .B(n2008), .Y(n2002) );
  OAI21X1 U2171 ( .A(n2008), .B(n2542), .C(n2002), .Y(N319) );
  NAND2X1 U2172 ( .A(fir_coefficient1[11]), .B(n2008), .Y(n2003) );
  OAI21X1 U2173 ( .A(n2008), .B(n2541), .C(n2003), .Y(N320) );
  NAND2X1 U2174 ( .A(fir_coefficient1[12]), .B(n2008), .Y(n2004) );
  OAI21X1 U2175 ( .A(n2008), .B(n2540), .C(n2004), .Y(N321) );
  NAND2X1 U2176 ( .A(fir_coefficient1[13]), .B(n2008), .Y(n2005) );
  OAI21X1 U2177 ( .A(n2008), .B(n2539), .C(n2005), .Y(N322) );
  NAND2X1 U2178 ( .A(fir_coefficient1[14]), .B(n2008), .Y(n2006) );
  OAI21X1 U2179 ( .A(n2008), .B(n2538), .C(n2006), .Y(N323) );
  NAND2X1 U2180 ( .A(fir_coefficient1[15]), .B(n2008), .Y(n2007) );
  OAI21X1 U2181 ( .A(n2008), .B(n2537), .C(n2007), .Y(N324) );
  NOR2X1 U2182 ( .A(n2494), .B(prev_haddr[3]), .Y(n2038) );
  NAND3X1 U2183 ( .A(prev_haddr[1]), .B(n2038), .C(n2048), .Y(n2017) );
  NAND2X1 U2184 ( .A(fir_coefficient0[0]), .B(n1937), .Y(n2009) );
  OAI21X1 U2185 ( .A(n1937), .B(n2552), .C(n2009), .Y(N293) );
  NAND2X1 U2186 ( .A(fir_coefficient0[1]), .B(n1937), .Y(n2010) );
  OAI21X1 U2187 ( .A(n1937), .B(n2551), .C(n2010), .Y(N294) );
  NAND2X1 U2188 ( .A(fir_coefficient0[2]), .B(n1937), .Y(n2011) );
  OAI21X1 U2189 ( .A(n1937), .B(n2550), .C(n2011), .Y(N295) );
  NAND2X1 U2190 ( .A(fir_coefficient0[3]), .B(n1937), .Y(n2012) );
  OAI21X1 U2191 ( .A(n1937), .B(n2549), .C(n2012), .Y(N296) );
  NAND2X1 U2192 ( .A(fir_coefficient0[4]), .B(n1937), .Y(n2013) );
  OAI21X1 U2193 ( .A(n1937), .B(n2548), .C(n2013), .Y(N297) );
  NAND2X1 U2194 ( .A(fir_coefficient0[5]), .B(n1937), .Y(n2014) );
  OAI21X1 U2195 ( .A(n1937), .B(n2547), .C(n2014), .Y(N298) );
  NAND2X1 U2196 ( .A(fir_coefficient0[6]), .B(n1937), .Y(n2015) );
  OAI21X1 U2197 ( .A(n1937), .B(n2546), .C(n2015), .Y(N299) );
  NAND2X1 U2198 ( .A(fir_coefficient0[7]), .B(n1937), .Y(n2016) );
  OAI21X1 U2199 ( .A(n1937), .B(n2545), .C(n2016), .Y(N300) );
  NAND3X1 U2200 ( .A(prev_haddr[1]), .B(n2038), .C(prev_haddr[0]), .Y(n2026)
         );
  NAND2X1 U2201 ( .A(fir_coefficient0[8]), .B(n1940), .Y(n2018) );
  OAI21X1 U2202 ( .A(n1940), .B(n2544), .C(n2018), .Y(N301) );
  NAND2X1 U2203 ( .A(fir_coefficient0[9]), .B(n1940), .Y(n2019) );
  OAI21X1 U2204 ( .A(n1940), .B(n2543), .C(n2019), .Y(N302) );
  NAND2X1 U2205 ( .A(fir_coefficient0[10]), .B(n1940), .Y(n2020) );
  OAI21X1 U2206 ( .A(n1940), .B(n2542), .C(n2020), .Y(N303) );
  NAND2X1 U2207 ( .A(fir_coefficient0[11]), .B(n1940), .Y(n2021) );
  OAI21X1 U2208 ( .A(n1940), .B(n2541), .C(n2021), .Y(N304) );
  NAND2X1 U2209 ( .A(fir_coefficient0[12]), .B(n1940), .Y(n2022) );
  OAI21X1 U2210 ( .A(n1940), .B(n2540), .C(n2022), .Y(N305) );
  NAND2X1 U2211 ( .A(fir_coefficient0[13]), .B(n1940), .Y(n2023) );
  OAI21X1 U2212 ( .A(n1940), .B(n2539), .C(n2023), .Y(N306) );
  NAND2X1 U2213 ( .A(fir_coefficient0[14]), .B(n1940), .Y(n2024) );
  OAI21X1 U2214 ( .A(n1940), .B(n2538), .C(n2024), .Y(N307) );
  NAND2X1 U2215 ( .A(fir_coefficient0[15]), .B(n1940), .Y(n2025) );
  OAI21X1 U2216 ( .A(n1940), .B(n2537), .C(n2025), .Y(N308) );
  AOI21X1 U2217 ( .A(n2490), .B(n2038), .C(n2536), .Y(n2027) );
  NAND3X1 U2218 ( .A(n2038), .B(n2490), .C(n2048), .Y(n2036) );
  NAND2X1 U2219 ( .A(sample_data[0]), .B(n1934), .Y(n2028) );
  OAI21X1 U2220 ( .A(n1934), .B(n2552), .C(n2028), .Y(N276) );
  NAND2X1 U2221 ( .A(sample_data[1]), .B(n1934), .Y(n2029) );
  OAI21X1 U2222 ( .A(n1934), .B(n2551), .C(n2029), .Y(N277) );
  NAND2X1 U2223 ( .A(sample_data[2]), .B(n1934), .Y(n2030) );
  OAI21X1 U2224 ( .A(n1934), .B(n2550), .C(n2030), .Y(N278) );
  NAND2X1 U2225 ( .A(sample_data[3]), .B(n1934), .Y(n2031) );
  OAI21X1 U2226 ( .A(n1934), .B(n2549), .C(n2031), .Y(N279) );
  NAND2X1 U2227 ( .A(sample_data[4]), .B(n1934), .Y(n2032) );
  OAI21X1 U2228 ( .A(n1934), .B(n2548), .C(n2032), .Y(N280) );
  NAND2X1 U2229 ( .A(sample_data[5]), .B(n1934), .Y(n2033) );
  OAI21X1 U2230 ( .A(n1934), .B(n2547), .C(n2033), .Y(N281) );
  NAND2X1 U2231 ( .A(sample_data[6]), .B(n1934), .Y(n2034) );
  OAI21X1 U2232 ( .A(n1934), .B(n2546), .C(n2034), .Y(N282) );
  NAND2X1 U2233 ( .A(sample_data[7]), .B(n1934), .Y(n2035) );
  OAI21X1 U2234 ( .A(n1934), .B(n2545), .C(n2035), .Y(N283) );
  NAND2X1 U2235 ( .A(n2038), .B(n2037), .Y(n2047) );
  NAND2X1 U2236 ( .A(sample_data[8]), .B(n2047), .Y(n2039) );
  OAI21X1 U2237 ( .A(n2047), .B(n2544), .C(n2039), .Y(N284) );
  NAND2X1 U2238 ( .A(sample_data[9]), .B(n2047), .Y(n2040) );
  OAI21X1 U2239 ( .A(n2047), .B(n2543), .C(n2040), .Y(N285) );
  NAND2X1 U2240 ( .A(sample_data[10]), .B(n2047), .Y(n2041) );
  OAI21X1 U2241 ( .A(n2047), .B(n2542), .C(n2041), .Y(N286) );
  NAND2X1 U2242 ( .A(sample_data[11]), .B(n2047), .Y(n2042) );
  OAI21X1 U2243 ( .A(n2047), .B(n2541), .C(n2042), .Y(N287) );
  NAND2X1 U2244 ( .A(sample_data[12]), .B(n2047), .Y(n2043) );
  OAI21X1 U2245 ( .A(n2047), .B(n2540), .C(n2043), .Y(N288) );
  NAND2X1 U2246 ( .A(sample_data[13]), .B(n2047), .Y(n2044) );
  OAI21X1 U2247 ( .A(n2047), .B(n2539), .C(n2044), .Y(N289) );
  NAND2X1 U2248 ( .A(sample_data[14]), .B(n2047), .Y(n2045) );
  OAI21X1 U2249 ( .A(n2047), .B(n2538), .C(n2045), .Y(N290) );
  NAND2X1 U2250 ( .A(sample_data[15]), .B(n2047), .Y(n2046) );
  OAI21X1 U2251 ( .A(n2047), .B(n2537), .C(n2046), .Y(N291) );
  INVX2 U2252 ( .A(prev_haddr[0]), .Y(n2048) );
  INVX2 U2253 ( .A(n1951), .Y(n2049) );
  INVX2 U2254 ( .A(n2027), .Y(N292) );
  OR2X1 U2255 ( .A(n2050), .B(n2051), .Y(next_hrdata[9]) );
  OAI21X1 U2256 ( .A(n2052), .B(n2053), .C(n2054), .Y(n2051) );
  AOI22X1 U2257 ( .A(n2055), .B(next_fir_coefficient2[9]), .C(n2056), .D(
        next_fir_coefficient3[9]), .Y(n2054) );
  INVX1 U2258 ( .A(next_fir_coefficient1[9]), .Y(n2052) );
  OAI21X1 U2259 ( .A(n2057), .B(n2058), .C(n2059), .Y(n2050) );
  AOI22X1 U2260 ( .A(n2060), .B(next_sample_data[9]), .C(n2061), .D(
        next_fir_coefficient0[9]), .Y(n2059) );
  OAI21X1 U2261 ( .A(n2062), .B(n2063), .C(n2064), .Y(next_hrdata[8]) );
  OAI21X1 U2262 ( .A(n2065), .B(n2066), .C(n2067), .Y(n2064) );
  NAND2X1 U2263 ( .A(n2068), .B(n2069), .Y(n2066) );
  AOI21X1 U2264 ( .A(n2070), .B(next_fir_coefficient3[8]), .C(n2071), .Y(n2069) );
  INVX1 U2265 ( .A(n2072), .Y(n2071) );
  AOI22X1 U2266 ( .A(n2073), .B(next_fir_coefficient2[8]), .C(
        next_sample_data[8]), .D(n2074), .Y(n2068) );
  NAND3X1 U2267 ( .A(n2075), .B(n2076), .C(n2077), .Y(n2065) );
  AOI22X1 U2268 ( .A(next_fir_coefficient0[8]), .B(n2078), .C(n2079), .D(
        fir_out[8]), .Y(n2077) );
  NAND3X1 U2269 ( .A(n2080), .B(n2081), .C(err), .Y(n2076) );
  OAI21X1 U2270 ( .A(n2082), .B(n2083), .C(next_fir_coefficient1[8]), .Y(n2075) );
  NAND2X1 U2271 ( .A(err), .B(n2080), .Y(n2063) );
  NAND3X1 U2272 ( .A(n2084), .B(n2081), .C(haddr[0]), .Y(n2062) );
  NAND2X1 U2273 ( .A(n2085), .B(n2086), .Y(next_hrdata[7]) );
  NOR2X1 U2274 ( .A(n2087), .B(n2088), .Y(n2086) );
  INVX1 U2275 ( .A(n2089), .Y(n2088) );
  AOI22X1 U2276 ( .A(next_fir_coefficient2[7]), .B(n2090), .C(
        next_fir_coefficient1[7]), .D(n2091), .Y(n2089) );
  OAI21X1 U2277 ( .A(n2092), .B(n2093), .C(n2094), .Y(n2087) );
  OAI21X1 U2278 ( .A(n2095), .B(n2096), .C(n2097), .Y(n2094) );
  OAI21X1 U2279 ( .A(n2098), .B(n2099), .C(n2100), .Y(n2096) );
  AOI22X1 U2280 ( .A(n2101), .B(next_sample_data[15]), .C(n2102), .D(
        next_fir_coefficient2[15]), .Y(n2100) );
  INVX1 U2281 ( .A(next_fir_coefficient3[15]), .Y(n2098) );
  OAI21X1 U2282 ( .A(n2103), .B(n2104), .C(n2105), .Y(n2095) );
  AOI22X1 U2283 ( .A(n2106), .B(next_fir_coefficient0[15]), .C(n2082), .D(
        next_fir_coefficient1[15]), .Y(n2105) );
  INVX1 U2284 ( .A(next_fir_coefficient0[7]), .Y(n2092) );
  AOI21X1 U2285 ( .A(fir_out[7]), .B(n2107), .C(n2108), .Y(n2085) );
  INVX1 U2286 ( .A(n2109), .Y(n2108) );
  AOI22X1 U2287 ( .A(next_sample_data[7]), .B(n2110), .C(
        next_fir_coefficient3[7]), .D(n2111), .Y(n2109) );
  OAI21X1 U2288 ( .A(n2112), .B(n2113), .C(n2114), .Y(next_sample_data[7]) );
  AOI22X1 U2289 ( .A(n1946), .B(hwdata[7]), .C(N283), .D(n1950), .Y(n2114) );
  INVX1 U2290 ( .A(sample_data[7]), .Y(n2113) );
  NAND2X1 U2291 ( .A(n2117), .B(n2118), .Y(next_hrdata[6]) );
  NOR2X1 U2292 ( .A(n2119), .B(n2120), .Y(n2118) );
  INVX1 U2293 ( .A(n2121), .Y(n2120) );
  AOI22X1 U2294 ( .A(n2090), .B(next_fir_coefficient2[6]), .C(n2091), .D(
        next_fir_coefficient1[6]), .Y(n2121) );
  OAI21X1 U2295 ( .A(n2093), .B(n2122), .C(n2123), .Y(n2119) );
  OAI21X1 U2296 ( .A(n2124), .B(n2125), .C(n2097), .Y(n2123) );
  OAI21X1 U2297 ( .A(n2126), .B(n2099), .C(n2127), .Y(n2125) );
  AOI22X1 U2298 ( .A(n2101), .B(next_sample_data[14]), .C(n2102), .D(
        next_fir_coefficient2[14]), .Y(n2127) );
  INVX1 U2299 ( .A(next_fir_coefficient3[14]), .Y(n2126) );
  OAI21X1 U2300 ( .A(n2103), .B(n2128), .C(n2129), .Y(n2124) );
  AOI22X1 U2301 ( .A(n2106), .B(next_fir_coefficient0[14]), .C(n2082), .D(
        next_fir_coefficient1[14]), .Y(n2129) );
  INVX1 U2302 ( .A(next_fir_coefficient0[6]), .Y(n2122) );
  AOI21X1 U2303 ( .A(fir_out[6]), .B(n2107), .C(n2130), .Y(n2117) );
  INVX1 U2304 ( .A(n2131), .Y(n2130) );
  AOI22X1 U2305 ( .A(next_sample_data[6]), .B(n2110), .C(n2111), .D(
        next_fir_coefficient3[6]), .Y(n2131) );
  OAI21X1 U2306 ( .A(n2112), .B(n2132), .C(n2133), .Y(next_sample_data[6]) );
  AOI22X1 U2307 ( .A(n1946), .B(hwdata[6]), .C(N282), .D(n1950), .Y(n2133) );
  INVX1 U2308 ( .A(sample_data[6]), .Y(n2132) );
  NAND2X1 U2309 ( .A(n2134), .B(n2135), .Y(next_hrdata[5]) );
  NOR2X1 U2310 ( .A(n2136), .B(n2137), .Y(n2135) );
  INVX1 U2311 ( .A(n2138), .Y(n2137) );
  AOI22X1 U2312 ( .A(n2090), .B(next_fir_coefficient2[5]), .C(n2091), .D(
        next_fir_coefficient1[5]), .Y(n2138) );
  OAI21X1 U2313 ( .A(n2093), .B(n2139), .C(n2140), .Y(n2136) );
  OAI21X1 U2314 ( .A(n2141), .B(n2142), .C(n2097), .Y(n2140) );
  OAI21X1 U2315 ( .A(n2143), .B(n2099), .C(n2144), .Y(n2142) );
  AOI22X1 U2316 ( .A(n2101), .B(next_sample_data[13]), .C(n2102), .D(
        next_fir_coefficient2[13]), .Y(n2144) );
  INVX1 U2317 ( .A(next_fir_coefficient3[13]), .Y(n2143) );
  OAI21X1 U2318 ( .A(n2103), .B(n2145), .C(n2146), .Y(n2141) );
  AOI22X1 U2319 ( .A(n2106), .B(next_fir_coefficient0[13]), .C(n2082), .D(
        next_fir_coefficient1[13]), .Y(n2146) );
  INVX1 U2320 ( .A(next_fir_coefficient0[5]), .Y(n2139) );
  AOI21X1 U2321 ( .A(fir_out[5]), .B(n2107), .C(n2147), .Y(n2134) );
  INVX1 U2322 ( .A(n2148), .Y(n2147) );
  AOI22X1 U2323 ( .A(next_sample_data[5]), .B(n2110), .C(n2111), .D(
        next_fir_coefficient3[5]), .Y(n2148) );
  OAI21X1 U2324 ( .A(n2112), .B(n2149), .C(n2150), .Y(next_sample_data[5]) );
  AOI22X1 U2325 ( .A(n1946), .B(hwdata[5]), .C(N281), .D(n1950), .Y(n2150) );
  INVX1 U2326 ( .A(sample_data[5]), .Y(n2149) );
  NAND2X1 U2327 ( .A(n2151), .B(n2152), .Y(next_hrdata[4]) );
  NOR2X1 U2328 ( .A(n2153), .B(n2154), .Y(n2152) );
  INVX1 U2329 ( .A(n2155), .Y(n2154) );
  AOI22X1 U2330 ( .A(n2090), .B(next_fir_coefficient2[4]), .C(n2091), .D(
        next_fir_coefficient1[4]), .Y(n2155) );
  OAI21X1 U2331 ( .A(n2093), .B(n2156), .C(n2157), .Y(n2153) );
  OAI21X1 U2332 ( .A(n2158), .B(n2159), .C(n2097), .Y(n2157) );
  OAI21X1 U2333 ( .A(n2160), .B(n2099), .C(n2161), .Y(n2159) );
  AOI22X1 U2334 ( .A(n2101), .B(next_sample_data[12]), .C(n2102), .D(
        next_fir_coefficient2[12]), .Y(n2161) );
  INVX1 U2335 ( .A(next_fir_coefficient3[12]), .Y(n2160) );
  OAI21X1 U2336 ( .A(n2103), .B(n2162), .C(n2163), .Y(n2158) );
  AOI22X1 U2337 ( .A(n2106), .B(next_fir_coefficient0[12]), .C(n2082), .D(
        next_fir_coefficient1[12]), .Y(n2163) );
  INVX1 U2338 ( .A(next_fir_coefficient0[4]), .Y(n2156) );
  AOI21X1 U2339 ( .A(fir_out[4]), .B(n2107), .C(n2164), .Y(n2151) );
  INVX1 U2340 ( .A(n2165), .Y(n2164) );
  AOI22X1 U2341 ( .A(next_sample_data[4]), .B(n2110), .C(n2111), .D(
        next_fir_coefficient3[4]), .Y(n2165) );
  OAI21X1 U2342 ( .A(n2112), .B(n2166), .C(n2167), .Y(next_sample_data[4]) );
  AOI22X1 U2343 ( .A(n1946), .B(hwdata[4]), .C(N280), .D(n1950), .Y(n2167) );
  INVX1 U2344 ( .A(sample_data[4]), .Y(n2166) );
  NAND2X1 U2345 ( .A(n2168), .B(n2169), .Y(next_hrdata[3]) );
  NOR2X1 U2346 ( .A(n2170), .B(n2171), .Y(n2169) );
  INVX1 U2347 ( .A(n2172), .Y(n2171) );
  AOI22X1 U2348 ( .A(n2090), .B(next_fir_coefficient2[3]), .C(n2091), .D(
        next_fir_coefficient1[3]), .Y(n2172) );
  OAI21X1 U2349 ( .A(n2093), .B(n2173), .C(n2174), .Y(n2170) );
  OAI21X1 U2350 ( .A(n2175), .B(n2176), .C(n2097), .Y(n2174) );
  OAI21X1 U2351 ( .A(n2177), .B(n2099), .C(n2178), .Y(n2176) );
  AOI22X1 U2352 ( .A(n2101), .B(next_sample_data[11]), .C(n2102), .D(
        next_fir_coefficient2[11]), .Y(n2178) );
  INVX1 U2353 ( .A(next_fir_coefficient3[11]), .Y(n2177) );
  OAI21X1 U2354 ( .A(n2103), .B(n2179), .C(n2180), .Y(n2175) );
  AOI22X1 U2355 ( .A(n2106), .B(next_fir_coefficient0[11]), .C(n2082), .D(
        next_fir_coefficient1[11]), .Y(n2180) );
  INVX1 U2356 ( .A(next_fir_coefficient0[3]), .Y(n2173) );
  AOI21X1 U2357 ( .A(fir_out[3]), .B(n2107), .C(n2181), .Y(n2168) );
  INVX1 U2358 ( .A(n2182), .Y(n2181) );
  AOI22X1 U2359 ( .A(next_sample_data[3]), .B(n2110), .C(n2111), .D(
        next_fir_coefficient3[3]), .Y(n2182) );
  OAI21X1 U2360 ( .A(n2112), .B(n2183), .C(n2184), .Y(next_sample_data[3]) );
  AOI22X1 U2361 ( .A(n1946), .B(hwdata[3]), .C(N279), .D(n1950), .Y(n2184) );
  INVX1 U2362 ( .A(sample_data[3]), .Y(n2183) );
  NAND2X1 U2363 ( .A(n2185), .B(n2186), .Y(next_hrdata[2]) );
  NOR2X1 U2364 ( .A(n2187), .B(n2188), .Y(n2186) );
  INVX1 U2365 ( .A(n2189), .Y(n2188) );
  AOI22X1 U2366 ( .A(n2090), .B(next_fir_coefficient2[2]), .C(n2091), .D(
        next_fir_coefficient1[2]), .Y(n2189) );
  OAI21X1 U2367 ( .A(n2093), .B(n2190), .C(n2191), .Y(n2187) );
  OAI21X1 U2368 ( .A(n2192), .B(n2193), .C(n2097), .Y(n2191) );
  OAI21X1 U2369 ( .A(n2194), .B(n2099), .C(n2195), .Y(n2193) );
  AOI22X1 U2370 ( .A(n2101), .B(next_sample_data[10]), .C(n2102), .D(
        next_fir_coefficient2[10]), .Y(n2195) );
  INVX1 U2371 ( .A(next_fir_coefficient3[10]), .Y(n2194) );
  OAI21X1 U2372 ( .A(n2103), .B(n2196), .C(n2197), .Y(n2192) );
  AOI22X1 U2373 ( .A(n2106), .B(next_fir_coefficient0[10]), .C(n2082), .D(
        next_fir_coefficient1[10]), .Y(n2197) );
  INVX1 U2374 ( .A(next_fir_coefficient0[2]), .Y(n2190) );
  AOI21X1 U2375 ( .A(fir_out[2]), .B(n2107), .C(n2198), .Y(n2185) );
  INVX1 U2376 ( .A(n2199), .Y(n2198) );
  AOI22X1 U2377 ( .A(next_sample_data[2]), .B(n2110), .C(n2111), .D(
        next_fir_coefficient3[2]), .Y(n2199) );
  OAI21X1 U2378 ( .A(n2112), .B(n2200), .C(n2201), .Y(next_sample_data[2]) );
  AOI22X1 U2379 ( .A(n1946), .B(hwdata[2]), .C(N278), .D(n1950), .Y(n2201) );
  INVX1 U2380 ( .A(sample_data[2]), .Y(n2200) );
  NAND2X1 U2381 ( .A(n2202), .B(n2203), .Y(next_hrdata[1]) );
  NOR2X1 U2382 ( .A(n2204), .B(n2205), .Y(n2203) );
  INVX1 U2383 ( .A(n2206), .Y(n2205) );
  AOI22X1 U2384 ( .A(n2090), .B(next_fir_coefficient2[1]), .C(n2091), .D(
        next_fir_coefficient1[1]), .Y(n2206) );
  OAI21X1 U2385 ( .A(n2093), .B(n2207), .C(n2208), .Y(n2204) );
  OAI21X1 U2386 ( .A(n2209), .B(n2210), .C(n2097), .Y(n2208) );
  OAI21X1 U2387 ( .A(n2211), .B(n2099), .C(n2212), .Y(n2210) );
  AOI22X1 U2388 ( .A(n2101), .B(next_sample_data[9]), .C(n2102), .D(
        next_fir_coefficient2[9]), .Y(n2212) );
  OAI21X1 U2389 ( .A(n2112), .B(n2213), .C(n2214), .Y(next_sample_data[9]) );
  AOI22X1 U2390 ( .A(n1946), .B(hwdata[9]), .C(N285), .D(n1950), .Y(n2214) );
  INVX1 U2391 ( .A(sample_data[9]), .Y(n2213) );
  INVX1 U2392 ( .A(next_fir_coefficient3[9]), .Y(n2211) );
  OAI21X1 U2393 ( .A(n2058), .B(n2103), .C(n2215), .Y(n2209) );
  AOI22X1 U2394 ( .A(n2106), .B(next_fir_coefficient0[9]), .C(n2082), .D(
        next_fir_coefficient1[9]), .Y(n2215) );
  INVX1 U2395 ( .A(n2216), .Y(n2106) );
  INVX1 U2396 ( .A(fir_out[9]), .Y(n2058) );
  INVX1 U2397 ( .A(next_fir_coefficient0[1]), .Y(n2207) );
  INVX1 U2398 ( .A(n2217), .Y(n2093) );
  AOI21X1 U2399 ( .A(fir_out[1]), .B(n2107), .C(n2218), .Y(n2202) );
  INVX1 U2400 ( .A(n2219), .Y(n2218) );
  AOI22X1 U2401 ( .A(next_sample_data[1]), .B(n2110), .C(n2111), .D(
        next_fir_coefficient3[1]), .Y(n2219) );
  OAI21X1 U2402 ( .A(n2112), .B(n2220), .C(n2221), .Y(next_sample_data[1]) );
  AOI22X1 U2403 ( .A(n1946), .B(hwdata[1]), .C(N277), .D(n1950), .Y(n2221) );
  INVX1 U2404 ( .A(sample_data[1]), .Y(n2220) );
  OR2X1 U2405 ( .A(n2222), .B(n2223), .Y(next_hrdata[15]) );
  OAI21X1 U2406 ( .A(n2224), .B(n2053), .C(n2225), .Y(n2223) );
  AOI22X1 U2407 ( .A(n2055), .B(next_fir_coefficient2[15]), .C(n2056), .D(
        next_fir_coefficient3[15]), .Y(n2225) );
  INVX1 U2408 ( .A(next_fir_coefficient1[15]), .Y(n2224) );
  OAI21X1 U2409 ( .A(n2057), .B(n2104), .C(n2226), .Y(n2222) );
  AOI22X1 U2410 ( .A(n2060), .B(next_sample_data[15]), .C(n2061), .D(
        next_fir_coefficient0[15]), .Y(n2226) );
  OAI21X1 U2411 ( .A(n2112), .B(n2227), .C(n2228), .Y(next_sample_data[15]) );
  AOI22X1 U2412 ( .A(n1946), .B(hwdata[15]), .C(N291), .D(n1950), .Y(n2228) );
  INVX1 U2413 ( .A(sample_data[15]), .Y(n2227) );
  INVX1 U2414 ( .A(fir_out[15]), .Y(n2104) );
  OR2X1 U2415 ( .A(n2229), .B(n2230), .Y(next_hrdata[14]) );
  OAI21X1 U2416 ( .A(n2231), .B(n2053), .C(n2232), .Y(n2230) );
  AOI22X1 U2417 ( .A(n2055), .B(next_fir_coefficient2[14]), .C(n2056), .D(
        next_fir_coefficient3[14]), .Y(n2232) );
  INVX1 U2418 ( .A(next_fir_coefficient1[14]), .Y(n2231) );
  OAI21X1 U2419 ( .A(n2057), .B(n2128), .C(n2233), .Y(n2229) );
  AOI22X1 U2420 ( .A(n2060), .B(next_sample_data[14]), .C(n2061), .D(
        next_fir_coefficient0[14]), .Y(n2233) );
  OAI21X1 U2421 ( .A(n2112), .B(n2234), .C(n2235), .Y(next_sample_data[14]) );
  AOI22X1 U2422 ( .A(n1946), .B(hwdata[14]), .C(N290), .D(n2116), .Y(n2235) );
  INVX1 U2423 ( .A(sample_data[14]), .Y(n2234) );
  INVX1 U2424 ( .A(fir_out[14]), .Y(n2128) );
  OR2X1 U2425 ( .A(n2236), .B(n2237), .Y(next_hrdata[13]) );
  OAI21X1 U2426 ( .A(n2238), .B(n2053), .C(n2239), .Y(n2237) );
  AOI22X1 U2427 ( .A(n2055), .B(next_fir_coefficient2[13]), .C(n2056), .D(
        next_fir_coefficient3[13]), .Y(n2239) );
  INVX1 U2428 ( .A(next_fir_coefficient1[13]), .Y(n2238) );
  OAI21X1 U2429 ( .A(n2057), .B(n2145), .C(n2240), .Y(n2236) );
  AOI22X1 U2430 ( .A(n2060), .B(next_sample_data[13]), .C(n2061), .D(
        next_fir_coefficient0[13]), .Y(n2240) );
  OAI21X1 U2431 ( .A(n2112), .B(n2241), .C(n2242), .Y(next_sample_data[13]) );
  AOI22X1 U2432 ( .A(n1946), .B(hwdata[13]), .C(N289), .D(n2116), .Y(n2242) );
  INVX1 U2433 ( .A(sample_data[13]), .Y(n2241) );
  INVX1 U2434 ( .A(fir_out[13]), .Y(n2145) );
  OR2X1 U2435 ( .A(n2243), .B(n2244), .Y(next_hrdata[12]) );
  OAI21X1 U2436 ( .A(n2245), .B(n2053), .C(n2246), .Y(n2244) );
  AOI22X1 U2437 ( .A(n2055), .B(next_fir_coefficient2[12]), .C(n2056), .D(
        next_fir_coefficient3[12]), .Y(n2246) );
  INVX1 U2438 ( .A(next_fir_coefficient1[12]), .Y(n2245) );
  OAI21X1 U2439 ( .A(n2057), .B(n2162), .C(n2247), .Y(n2243) );
  AOI22X1 U2440 ( .A(n2060), .B(next_sample_data[12]), .C(n2061), .D(
        next_fir_coefficient0[12]), .Y(n2247) );
  OAI21X1 U2441 ( .A(n2112), .B(n2248), .C(n2249), .Y(next_sample_data[12]) );
  AOI22X1 U2442 ( .A(n1946), .B(hwdata[12]), .C(N288), .D(n2116), .Y(n2249) );
  INVX1 U2443 ( .A(sample_data[12]), .Y(n2248) );
  INVX1 U2444 ( .A(fir_out[12]), .Y(n2162) );
  OR2X1 U2445 ( .A(n2250), .B(n2251), .Y(next_hrdata[11]) );
  OAI21X1 U2446 ( .A(n2252), .B(n2053), .C(n2253), .Y(n2251) );
  AOI22X1 U2447 ( .A(n2055), .B(next_fir_coefficient2[11]), .C(n2056), .D(
        next_fir_coefficient3[11]), .Y(n2253) );
  INVX1 U2448 ( .A(next_fir_coefficient1[11]), .Y(n2252) );
  OAI21X1 U2449 ( .A(n2057), .B(n2179), .C(n2254), .Y(n2250) );
  AOI22X1 U2450 ( .A(n2060), .B(next_sample_data[11]), .C(n2061), .D(
        next_fir_coefficient0[11]), .Y(n2254) );
  OAI21X1 U2451 ( .A(n2112), .B(n2255), .C(n2256), .Y(next_sample_data[11]) );
  AOI22X1 U2452 ( .A(n1946), .B(hwdata[11]), .C(N287), .D(n2116), .Y(n2256) );
  INVX1 U2453 ( .A(sample_data[11]), .Y(n2255) );
  INVX1 U2454 ( .A(fir_out[11]), .Y(n2179) );
  OR2X1 U2455 ( .A(n2257), .B(n2258), .Y(next_hrdata[10]) );
  OAI21X1 U2456 ( .A(n2259), .B(n2053), .C(n2260), .Y(n2258) );
  AOI22X1 U2457 ( .A(n2055), .B(next_fir_coefficient2[10]), .C(n2056), .D(
        next_fir_coefficient3[10]), .Y(n2260) );
  INVX1 U2458 ( .A(n2261), .Y(n2056) );
  INVX1 U2459 ( .A(n2262), .Y(n2055) );
  INVX1 U2460 ( .A(next_fir_coefficient1[10]), .Y(n2259) );
  OAI21X1 U2461 ( .A(n2057), .B(n2196), .C(n2263), .Y(n2257) );
  AOI22X1 U2462 ( .A(n2060), .B(next_sample_data[10]), .C(n2061), .D(
        next_fir_coefficient0[10]), .Y(n2263) );
  INVX1 U2463 ( .A(n2264), .Y(n2061) );
  OAI21X1 U2464 ( .A(n2112), .B(n2265), .C(n2266), .Y(next_sample_data[10]) );
  AOI22X1 U2465 ( .A(n1946), .B(hwdata[10]), .C(N286), .D(n2116), .Y(n2266) );
  INVX1 U2466 ( .A(sample_data[10]), .Y(n2265) );
  INVX1 U2467 ( .A(n2267), .Y(n2060) );
  INVX1 U2468 ( .A(fir_out[10]), .Y(n2196) );
  NAND3X1 U2469 ( .A(n2268), .B(n2269), .C(n2270), .Y(next_hrdata[0]) );
  NOR2X1 U2470 ( .A(n2271), .B(n2272), .Y(n2270) );
  INVX1 U2471 ( .A(n2273), .Y(n2272) );
  AOI22X1 U2472 ( .A(n2091), .B(next_fir_coefficient1[0]), .C(n2217), .D(
        next_fir_coefficient0[0]), .Y(n2273) );
  OAI21X1 U2473 ( .A(n2274), .B(n2275), .C(n2264), .Y(n2217) );
  NAND2X1 U2474 ( .A(n2067), .B(n2078), .Y(n2264) );
  NAND2X1 U2475 ( .A(n2275), .B(n2216), .Y(n2078) );
  NAND2X1 U2476 ( .A(n2276), .B(n2277), .Y(n2275) );
  OAI21X1 U2477 ( .A(n2274), .B(n2278), .C(n2053), .Y(n2091) );
  OAI21X1 U2478 ( .A(n2083), .B(n2082), .C(n2067), .Y(n2053) );
  INVX1 U2479 ( .A(n2278), .Y(n2083) );
  NAND3X1 U2480 ( .A(n2279), .B(n2081), .C(n2280), .Y(n2278) );
  OAI21X1 U2481 ( .A(n2281), .B(n2274), .C(n2282), .Y(n2271) );
  OAI21X1 U2482 ( .A(n2283), .B(n2284), .C(n2067), .Y(n2282) );
  INVX1 U2483 ( .A(n2285), .Y(n2283) );
  INVX1 U2484 ( .A(n2286), .Y(n2281) );
  NAND3X1 U2485 ( .A(n2287), .B(n2072), .C(n2288), .Y(n2286) );
  NOR2X1 U2486 ( .A(n2289), .B(n2290), .Y(n2288) );
  INVX1 U2487 ( .A(n2291), .Y(n2290) );
  AOI22X1 U2488 ( .A(next_fir_coefficient2[8]), .B(n2102), .C(
        next_fir_coefficient1[8]), .D(n2082), .Y(n2291) );
  INVX1 U2489 ( .A(n2292), .Y(n2082) );
  NAND3X1 U2490 ( .A(haddr[0]), .B(n2081), .C(n2280), .Y(n2292) );
  INVX1 U2491 ( .A(n2293), .Y(n2102) );
  OAI21X1 U2492 ( .A(n2294), .B(n2216), .C(n2285), .Y(n2289) );
  NAND3X1 U2493 ( .A(haddr[2]), .B(next_new_coefficient_set), .C(n2295), .Y(
        n2285) );
  NOR2X1 U2494 ( .A(n2296), .B(n2297), .Y(n2295) );
  NAND2X1 U2495 ( .A(n2298), .B(n2277), .Y(n2216) );
  INVX1 U2496 ( .A(next_fir_coefficient0[8]), .Y(n2294) );
  AOI22X1 U2497 ( .A(next_sample_data[8]), .B(n2101), .C(n2299), .D(fir_out[8]), .Y(n2072) );
  OAI21X1 U2498 ( .A(n2112), .B(n2300), .C(n2301), .Y(next_sample_data[8]) );
  AOI22X1 U2499 ( .A(n1946), .B(hwdata[8]), .C(N284), .D(n2116), .Y(n2301) );
  INVX1 U2500 ( .A(sample_data[8]), .Y(n2300) );
  AOI22X1 U2501 ( .A(n2302), .B(next_fir_coefficient3[8]), .C(n2284), .D(n2279), .Y(n2287) );
  NOR2X1 U2502 ( .A(n2303), .B(n2304), .Y(n2284) );
  OAI21X1 U2503 ( .A(modwait), .B(next_new_coefficient_set), .C(n2081), .Y(
        n2304) );
  INVX1 U2504 ( .A(n2305), .Y(next_new_coefficient_set) );
  AOI21X1 U2505 ( .A(N357), .B(n1950), .C(n2306), .Y(n2305) );
  OAI21X1 U2506 ( .A(n2307), .B(n2308), .C(n2309), .Y(n2306) );
  OAI21X1 U2507 ( .A(n2310), .B(n2311), .C(N214), .Y(n2309) );
  OAI21X1 U2508 ( .A(n2312), .B(n2313), .C(n2314), .Y(n2311) );
  AND2X1 U2509 ( .A(n2315), .B(n2316), .Y(n2312) );
  NAND3X1 U2510 ( .A(n2317), .B(n2318), .C(n2319), .Y(n2310) );
  OR2X1 U2511 ( .A(n2320), .B(n2321), .Y(n2308) );
  NAND2X1 U2512 ( .A(prev_hsize), .B(hwdata[0]), .Y(n2307) );
  AOI22X1 U2513 ( .A(next_fir_coefficient2[0]), .B(n2090), .C(
        next_fir_coefficient3[0]), .D(n2111), .Y(n2269) );
  OAI21X1 U2514 ( .A(n2274), .B(n2322), .C(n2261), .Y(n2111) );
  NAND2X1 U2515 ( .A(n2067), .B(n2070), .Y(n2261) );
  NAND2X1 U2516 ( .A(n2322), .B(n2099), .Y(n2070) );
  INVX1 U2517 ( .A(n2302), .Y(n2099) );
  NOR2X1 U2518 ( .A(n2323), .B(n2279), .Y(n2302) );
  OR2X1 U2519 ( .A(n2323), .B(haddr[0]), .Y(n2322) );
  NAND3X1 U2520 ( .A(haddr[2]), .B(n2081), .C(haddr[3]), .Y(n2323) );
  OAI21X1 U2521 ( .A(n2274), .B(n2324), .C(n2262), .Y(n2090) );
  NAND2X1 U2522 ( .A(n2067), .B(n2073), .Y(n2262) );
  NAND2X1 U2523 ( .A(n2324), .B(n2293), .Y(n2073) );
  NAND2X1 U2524 ( .A(n2280), .B(n2298), .Y(n2293) );
  NAND2X1 U2525 ( .A(n2280), .B(n2276), .Y(n2324) );
  NOR2X1 U2526 ( .A(n2297), .B(haddr[2]), .Y(n2280) );
  AOI22X1 U2527 ( .A(n2110), .B(next_sample_data[0]), .C(fir_out[0]), .D(n2107), .Y(n2268) );
  OAI21X1 U2528 ( .A(n2325), .B(n2274), .C(n2057), .Y(n2107) );
  OAI21X1 U2529 ( .A(n2079), .B(n2299), .C(n2067), .Y(n2057) );
  INVX1 U2530 ( .A(n2103), .Y(n2299) );
  NAND2X1 U2531 ( .A(n2080), .B(n2298), .Y(n2103) );
  NOR2X1 U2532 ( .A(n2081), .B(n2279), .Y(n2298) );
  INVX1 U2533 ( .A(n2079), .Y(n2325) );
  NOR2X1 U2534 ( .A(n2303), .B(n2296), .Y(n2079) );
  INVX1 U2535 ( .A(n2276), .Y(n2296) );
  NOR2X1 U2536 ( .A(n2081), .B(haddr[0]), .Y(n2276) );
  INVX1 U2537 ( .A(n2080), .Y(n2303) );
  OAI21X1 U2538 ( .A(n2112), .B(n2326), .C(n2327), .Y(next_sample_data[0]) );
  AOI22X1 U2539 ( .A(n1946), .B(hwdata[0]), .C(N276), .D(n2116), .Y(n2327) );
  INVX1 U2540 ( .A(sample_data[0]), .Y(n2326) );
  OAI21X1 U2541 ( .A(n2328), .B(n2274), .C(n2267), .Y(n2110) );
  OAI21X1 U2542 ( .A(n2074), .B(n2101), .C(n2067), .Y(n2267) );
  AND2X1 U2543 ( .A(hsize), .B(n2084), .Y(n2067) );
  INVX1 U2544 ( .A(n2329), .Y(n2084) );
  INVX1 U2545 ( .A(n2330), .Y(n2101) );
  NAND3X1 U2546 ( .A(n2277), .B(n2081), .C(haddr[0]), .Y(n2330) );
  INVX1 U2547 ( .A(n2328), .Y(n2074) );
  INVX1 U2548 ( .A(n2097), .Y(n2274) );
  NOR2X1 U2549 ( .A(n2329), .B(hsize), .Y(n2097) );
  NAND3X1 U2550 ( .A(htrans[1]), .B(hsel), .C(n2331), .Y(n2329) );
  NOR2X1 U2551 ( .A(hwrite), .B(htrans[0]), .Y(n2331) );
  NAND3X1 U2552 ( .A(n2279), .B(n2081), .C(n2277), .Y(n2328) );
  AND2X1 U2553 ( .A(haddr[2]), .B(n2297), .Y(n2277) );
  INVX1 U2554 ( .A(haddr[3]), .Y(n2297) );
  INVX1 U2555 ( .A(haddr[1]), .Y(n2081) );
  INVX1 U2556 ( .A(haddr[0]), .Y(n2279) );
  OAI21X1 U2557 ( .A(n2332), .B(n2333), .C(n2334), .Y(next_fir_coefficient3[9]) );
  AOI22X1 U2558 ( .A(n1942), .B(hwdata[9]), .C(fir_coefficient3[9]), .D(n1944), 
        .Y(n2334) );
  INVX1 U2559 ( .A(N350), .Y(n2333) );
  OAI21X1 U2560 ( .A(n2332), .B(n2337), .C(n2338), .Y(next_fir_coefficient3[8]) );
  AOI22X1 U2561 ( .A(n1942), .B(hwdata[8]), .C(fir_coefficient3[8]), .D(n1944), 
        .Y(n2338) );
  INVX1 U2562 ( .A(N349), .Y(n2337) );
  OAI21X1 U2563 ( .A(n2332), .B(n2339), .C(n2340), .Y(next_fir_coefficient3[7]) );
  AOI22X1 U2564 ( .A(n1942), .B(hwdata[7]), .C(fir_coefficient3[7]), .D(n1944), 
        .Y(n2340) );
  INVX1 U2565 ( .A(N348), .Y(n2339) );
  OAI21X1 U2566 ( .A(n2332), .B(n2341), .C(n2342), .Y(next_fir_coefficient3[6]) );
  AOI22X1 U2567 ( .A(n1942), .B(hwdata[6]), .C(fir_coefficient3[6]), .D(n1944), 
        .Y(n2342) );
  INVX1 U2568 ( .A(N347), .Y(n2341) );
  OAI21X1 U2569 ( .A(n2332), .B(n2343), .C(n2344), .Y(next_fir_coefficient3[5]) );
  AOI22X1 U2570 ( .A(n1942), .B(hwdata[5]), .C(fir_coefficient3[5]), .D(n1944), 
        .Y(n2344) );
  INVX1 U2571 ( .A(N346), .Y(n2343) );
  OAI21X1 U2572 ( .A(n2332), .B(n2345), .C(n2346), .Y(next_fir_coefficient3[4]) );
  AOI22X1 U2573 ( .A(n1942), .B(hwdata[4]), .C(fir_coefficient3[4]), .D(n1944), 
        .Y(n2346) );
  INVX1 U2574 ( .A(N345), .Y(n2345) );
  OAI21X1 U2575 ( .A(n2332), .B(n2347), .C(n2348), .Y(next_fir_coefficient3[3]) );
  AOI22X1 U2576 ( .A(n1942), .B(hwdata[3]), .C(fir_coefficient3[3]), .D(n1944), 
        .Y(n2348) );
  INVX1 U2577 ( .A(N344), .Y(n2347) );
  OAI21X1 U2578 ( .A(n2332), .B(n2349), .C(n2350), .Y(next_fir_coefficient3[2]) );
  AOI22X1 U2579 ( .A(n1942), .B(hwdata[2]), .C(fir_coefficient3[2]), .D(n1944), 
        .Y(n2350) );
  INVX1 U2580 ( .A(N343), .Y(n2349) );
  OAI21X1 U2581 ( .A(n2332), .B(n2351), .C(n2352), .Y(next_fir_coefficient3[1]) );
  AOI22X1 U2582 ( .A(n1942), .B(hwdata[1]), .C(fir_coefficient3[1]), .D(n1944), 
        .Y(n2352) );
  INVX1 U2583 ( .A(N342), .Y(n2351) );
  OAI21X1 U2584 ( .A(n2332), .B(n2353), .C(n2354), .Y(
        next_fir_coefficient3[15]) );
  AOI22X1 U2585 ( .A(n1942), .B(hwdata[15]), .C(fir_coefficient3[15]), .D(
        n1944), .Y(n2354) );
  INVX1 U2586 ( .A(N356), .Y(n2353) );
  OAI21X1 U2587 ( .A(n2332), .B(n2355), .C(n2356), .Y(
        next_fir_coefficient3[14]) );
  AOI22X1 U2588 ( .A(n1942), .B(hwdata[14]), .C(fir_coefficient3[14]), .D(
        n1944), .Y(n2356) );
  INVX1 U2589 ( .A(N355), .Y(n2355) );
  OAI21X1 U2590 ( .A(n2332), .B(n2357), .C(n2358), .Y(
        next_fir_coefficient3[13]) );
  AOI22X1 U2591 ( .A(n1942), .B(hwdata[13]), .C(fir_coefficient3[13]), .D(
        n1944), .Y(n2358) );
  INVX1 U2592 ( .A(N354), .Y(n2357) );
  OAI21X1 U2593 ( .A(n2332), .B(n2359), .C(n2360), .Y(
        next_fir_coefficient3[12]) );
  AOI22X1 U2594 ( .A(n1942), .B(hwdata[12]), .C(fir_coefficient3[12]), .D(
        n1944), .Y(n2360) );
  INVX1 U2595 ( .A(N353), .Y(n2359) );
  OAI21X1 U2596 ( .A(n2332), .B(n2361), .C(n2362), .Y(
        next_fir_coefficient3[11]) );
  AOI22X1 U2597 ( .A(n1942), .B(hwdata[11]), .C(fir_coefficient3[11]), .D(
        n1944), .Y(n2362) );
  INVX1 U2598 ( .A(N352), .Y(n2361) );
  OAI21X1 U2599 ( .A(n2332), .B(n2363), .C(n2364), .Y(
        next_fir_coefficient3[10]) );
  AOI22X1 U2600 ( .A(n1942), .B(hwdata[10]), .C(fir_coefficient3[10]), .D(
        n1944), .Y(n2364) );
  INVX1 U2601 ( .A(N351), .Y(n2363) );
  OAI21X1 U2602 ( .A(n2332), .B(n2365), .C(n2366), .Y(next_fir_coefficient3[0]) );
  AOI22X1 U2603 ( .A(n1942), .B(hwdata[0]), .C(fir_coefficient3[0]), .D(n1944), 
        .Y(n2366) );
  NAND2X1 U2604 ( .A(n2314), .B(n2367), .Y(n2336) );
  OAI21X1 U2605 ( .A(n2368), .B(n2369), .C(prev_hsize), .Y(n2367) );
  NAND2X1 U2606 ( .A(n2370), .B(n2371), .Y(n2369) );
  NOR3X1 U2607 ( .A(n2321), .B(n2313), .C(n2372), .Y(n2335) );
  INVX1 U2608 ( .A(N341), .Y(n2365) );
  OAI21X1 U2609 ( .A(n2332), .B(n2373), .C(n2374), .Y(next_fir_coefficient2[9]) );
  AOI22X1 U2610 ( .A(n1939), .B(hwdata[9]), .C(fir_coefficient2[9]), .D(n1935), 
        .Y(n2374) );
  INVX1 U2611 ( .A(N334), .Y(n2373) );
  OAI21X1 U2612 ( .A(n2332), .B(n2377), .C(n2378), .Y(next_fir_coefficient2[8]) );
  AOI22X1 U2613 ( .A(n1939), .B(hwdata[8]), .C(fir_coefficient2[8]), .D(n1935), 
        .Y(n2378) );
  INVX1 U2614 ( .A(N333), .Y(n2377) );
  OAI21X1 U2615 ( .A(n2332), .B(n2379), .C(n2380), .Y(next_fir_coefficient2[7]) );
  AOI22X1 U2616 ( .A(n1939), .B(hwdata[7]), .C(fir_coefficient2[7]), .D(n1935), 
        .Y(n2380) );
  INVX1 U2617 ( .A(N332), .Y(n2379) );
  OAI21X1 U2618 ( .A(n2332), .B(n2381), .C(n2382), .Y(next_fir_coefficient2[6]) );
  AOI22X1 U2619 ( .A(n1939), .B(hwdata[6]), .C(fir_coefficient2[6]), .D(n1935), 
        .Y(n2382) );
  INVX1 U2620 ( .A(N331), .Y(n2381) );
  OAI21X1 U2621 ( .A(n2332), .B(n2383), .C(n2384), .Y(next_fir_coefficient2[5]) );
  AOI22X1 U2622 ( .A(n1939), .B(hwdata[5]), .C(fir_coefficient2[5]), .D(n1935), 
        .Y(n2384) );
  INVX1 U2623 ( .A(N330), .Y(n2383) );
  OAI21X1 U2624 ( .A(n2332), .B(n2385), .C(n2386), .Y(next_fir_coefficient2[4]) );
  AOI22X1 U2625 ( .A(n1939), .B(hwdata[4]), .C(fir_coefficient2[4]), .D(n1935), 
        .Y(n2386) );
  INVX1 U2626 ( .A(N329), .Y(n2385) );
  OAI21X1 U2627 ( .A(n2332), .B(n2387), .C(n2388), .Y(next_fir_coefficient2[3]) );
  AOI22X1 U2628 ( .A(n1939), .B(hwdata[3]), .C(fir_coefficient2[3]), .D(n1935), 
        .Y(n2388) );
  INVX1 U2629 ( .A(N328), .Y(n2387) );
  OAI21X1 U2630 ( .A(n2332), .B(n2389), .C(n2390), .Y(next_fir_coefficient2[2]) );
  AOI22X1 U2631 ( .A(n1939), .B(hwdata[2]), .C(fir_coefficient2[2]), .D(n1935), 
        .Y(n2390) );
  INVX1 U2632 ( .A(N327), .Y(n2389) );
  OAI21X1 U2633 ( .A(n2332), .B(n2391), .C(n2392), .Y(next_fir_coefficient2[1]) );
  AOI22X1 U2634 ( .A(n1939), .B(hwdata[1]), .C(fir_coefficient2[1]), .D(n1935), 
        .Y(n2392) );
  INVX1 U2635 ( .A(N326), .Y(n2391) );
  OAI21X1 U2636 ( .A(n2332), .B(n2393), .C(n2394), .Y(
        next_fir_coefficient2[15]) );
  AOI22X1 U2637 ( .A(n1939), .B(hwdata[15]), .C(fir_coefficient2[15]), .D(
        n1935), .Y(n2394) );
  INVX1 U2638 ( .A(N340), .Y(n2393) );
  OAI21X1 U2639 ( .A(n2332), .B(n2395), .C(n2396), .Y(
        next_fir_coefficient2[14]) );
  AOI22X1 U2640 ( .A(n1939), .B(hwdata[14]), .C(fir_coefficient2[14]), .D(
        n1935), .Y(n2396) );
  INVX1 U2641 ( .A(N339), .Y(n2395) );
  OAI21X1 U2642 ( .A(n2332), .B(n2397), .C(n2398), .Y(
        next_fir_coefficient2[13]) );
  AOI22X1 U2643 ( .A(n1939), .B(hwdata[13]), .C(fir_coefficient2[13]), .D(
        n1935), .Y(n2398) );
  INVX1 U2644 ( .A(N338), .Y(n2397) );
  OAI21X1 U2645 ( .A(n2332), .B(n2399), .C(n2400), .Y(
        next_fir_coefficient2[12]) );
  AOI22X1 U2646 ( .A(n1939), .B(hwdata[12]), .C(fir_coefficient2[12]), .D(
        n1935), .Y(n2400) );
  INVX1 U2647 ( .A(N337), .Y(n2399) );
  OAI21X1 U2648 ( .A(n2332), .B(n2401), .C(n2402), .Y(
        next_fir_coefficient2[11]) );
  AOI22X1 U2649 ( .A(n1939), .B(hwdata[11]), .C(fir_coefficient2[11]), .D(
        n1935), .Y(n2402) );
  INVX1 U2650 ( .A(N336), .Y(n2401) );
  OAI21X1 U2651 ( .A(n2332), .B(n2403), .C(n2404), .Y(
        next_fir_coefficient2[10]) );
  AOI22X1 U2652 ( .A(n1939), .B(hwdata[10]), .C(fir_coefficient2[10]), .D(
        n1935), .Y(n2404) );
  INVX1 U2653 ( .A(N335), .Y(n2403) );
  OAI21X1 U2654 ( .A(n2332), .B(n2405), .C(n2406), .Y(next_fir_coefficient2[0]) );
  AOI22X1 U2655 ( .A(n1939), .B(hwdata[0]), .C(fir_coefficient2[0]), .D(n1935), 
        .Y(n2406) );
  NAND2X1 U2656 ( .A(n2314), .B(n2407), .Y(n2376) );
  OAI21X1 U2657 ( .A(n2368), .B(n2408), .C(prev_hsize), .Y(n2407) );
  NAND2X1 U2658 ( .A(n2370), .B(n2372), .Y(n2408) );
  NOR3X1 U2659 ( .A(n2321), .B(n2313), .C(n2371), .Y(n2375) );
  INVX1 U2660 ( .A(N325), .Y(n2405) );
  OAI21X1 U2661 ( .A(n2332), .B(n2409), .C(n2410), .Y(next_fir_coefficient1[9]) );
  AOI22X1 U2662 ( .A(n1936), .B(hwdata[9]), .C(fir_coefficient1[9]), .D(n1938), 
        .Y(n2410) );
  INVX1 U2663 ( .A(N318), .Y(n2409) );
  OAI21X1 U2664 ( .A(n2332), .B(n2413), .C(n2414), .Y(next_fir_coefficient1[8]) );
  AOI22X1 U2665 ( .A(n1936), .B(hwdata[8]), .C(fir_coefficient1[8]), .D(n1938), 
        .Y(n2414) );
  INVX1 U2666 ( .A(N317), .Y(n2413) );
  OAI21X1 U2667 ( .A(n2332), .B(n2415), .C(n2416), .Y(next_fir_coefficient1[7]) );
  AOI22X1 U2668 ( .A(n1936), .B(hwdata[7]), .C(fir_coefficient1[7]), .D(n1938), 
        .Y(n2416) );
  INVX1 U2669 ( .A(N316), .Y(n2415) );
  OAI21X1 U2670 ( .A(n2332), .B(n2417), .C(n2418), .Y(next_fir_coefficient1[6]) );
  AOI22X1 U2671 ( .A(n1936), .B(hwdata[6]), .C(fir_coefficient1[6]), .D(n1938), 
        .Y(n2418) );
  INVX1 U2672 ( .A(N315), .Y(n2417) );
  OAI21X1 U2673 ( .A(n2332), .B(n2419), .C(n2420), .Y(next_fir_coefficient1[5]) );
  AOI22X1 U2674 ( .A(n1936), .B(hwdata[5]), .C(fir_coefficient1[5]), .D(n1938), 
        .Y(n2420) );
  INVX1 U2675 ( .A(N314), .Y(n2419) );
  OAI21X1 U2676 ( .A(n2332), .B(n2421), .C(n2422), .Y(next_fir_coefficient1[4]) );
  AOI22X1 U2677 ( .A(n1936), .B(hwdata[4]), .C(fir_coefficient1[4]), .D(n1938), 
        .Y(n2422) );
  INVX1 U2678 ( .A(N313), .Y(n2421) );
  OAI21X1 U2679 ( .A(n2332), .B(n2423), .C(n2424), .Y(next_fir_coefficient1[3]) );
  AOI22X1 U2680 ( .A(n1936), .B(hwdata[3]), .C(fir_coefficient1[3]), .D(n1938), 
        .Y(n2424) );
  INVX1 U2681 ( .A(N312), .Y(n2423) );
  OAI21X1 U2682 ( .A(n2332), .B(n2425), .C(n2426), .Y(next_fir_coefficient1[2]) );
  AOI22X1 U2683 ( .A(n1936), .B(hwdata[2]), .C(fir_coefficient1[2]), .D(n1938), 
        .Y(n2426) );
  INVX1 U2684 ( .A(N311), .Y(n2425) );
  OAI21X1 U2685 ( .A(n2332), .B(n2427), .C(n2428), .Y(next_fir_coefficient1[1]) );
  AOI22X1 U2686 ( .A(n1936), .B(hwdata[1]), .C(fir_coefficient1[1]), .D(n1938), 
        .Y(n2428) );
  INVX1 U2687 ( .A(N310), .Y(n2427) );
  OAI21X1 U2688 ( .A(n2332), .B(n2429), .C(n2430), .Y(
        next_fir_coefficient1[15]) );
  AOI22X1 U2689 ( .A(n1936), .B(hwdata[15]), .C(fir_coefficient1[15]), .D(
        n1938), .Y(n2430) );
  INVX1 U2690 ( .A(N324), .Y(n2429) );
  OAI21X1 U2691 ( .A(n2332), .B(n2431), .C(n2432), .Y(
        next_fir_coefficient1[14]) );
  AOI22X1 U2692 ( .A(n1936), .B(hwdata[14]), .C(fir_coefficient1[14]), .D(
        n1938), .Y(n2432) );
  INVX1 U2693 ( .A(N323), .Y(n2431) );
  OAI21X1 U2694 ( .A(n2332), .B(n2433), .C(n2434), .Y(
        next_fir_coefficient1[13]) );
  AOI22X1 U2695 ( .A(n1936), .B(hwdata[13]), .C(fir_coefficient1[13]), .D(
        n1938), .Y(n2434) );
  INVX1 U2696 ( .A(N322), .Y(n2433) );
  OAI21X1 U2697 ( .A(n2332), .B(n2435), .C(n2436), .Y(
        next_fir_coefficient1[12]) );
  AOI22X1 U2698 ( .A(n1936), .B(hwdata[12]), .C(fir_coefficient1[12]), .D(
        n1938), .Y(n2436) );
  INVX1 U2699 ( .A(N321), .Y(n2435) );
  OAI21X1 U2700 ( .A(n2332), .B(n2437), .C(n2438), .Y(
        next_fir_coefficient1[11]) );
  AOI22X1 U2701 ( .A(n1936), .B(hwdata[11]), .C(fir_coefficient1[11]), .D(
        n1938), .Y(n2438) );
  INVX1 U2702 ( .A(N320), .Y(n2437) );
  OAI21X1 U2703 ( .A(n2332), .B(n2439), .C(n2440), .Y(
        next_fir_coefficient1[10]) );
  AOI22X1 U2704 ( .A(n1936), .B(hwdata[10]), .C(fir_coefficient1[10]), .D(
        n1938), .Y(n2440) );
  INVX1 U2705 ( .A(N319), .Y(n2439) );
  OAI21X1 U2706 ( .A(n2332), .B(n2441), .C(n2442), .Y(next_fir_coefficient1[0]) );
  AOI22X1 U2707 ( .A(n1936), .B(hwdata[0]), .C(fir_coefficient1[0]), .D(n1938), 
        .Y(n2442) );
  NAND2X1 U2708 ( .A(n2314), .B(n2443), .Y(n2412) );
  OAI21X1 U2709 ( .A(n2444), .B(n2445), .C(prev_hsize), .Y(n2443) );
  NOR2X1 U2710 ( .A(n2319), .B(n2321), .Y(n2411) );
  NAND2X1 U2711 ( .A(n2446), .B(prev_hsize), .Y(n2319) );
  INVX1 U2712 ( .A(N309), .Y(n2441) );
  OAI21X1 U2713 ( .A(n2332), .B(n2447), .C(n2448), .Y(next_fir_coefficient0[9]) );
  AOI22X1 U2714 ( .A(n1933), .B(hwdata[9]), .C(fir_coefficient0[9]), .D(n1932), 
        .Y(n2448) );
  INVX1 U2715 ( .A(N302), .Y(n2447) );
  OAI21X1 U2716 ( .A(n2332), .B(n2451), .C(n2452), .Y(next_fir_coefficient0[8]) );
  AOI22X1 U2717 ( .A(n1933), .B(hwdata[8]), .C(fir_coefficient0[8]), .D(n1932), 
        .Y(n2452) );
  INVX1 U2718 ( .A(N301), .Y(n2451) );
  OAI21X1 U2719 ( .A(n2332), .B(n2453), .C(n2454), .Y(next_fir_coefficient0[7]) );
  AOI22X1 U2720 ( .A(n1933), .B(hwdata[7]), .C(fir_coefficient0[7]), .D(n1932), 
        .Y(n2454) );
  INVX1 U2721 ( .A(N300), .Y(n2453) );
  OAI21X1 U2722 ( .A(n2332), .B(n2455), .C(n2456), .Y(next_fir_coefficient0[6]) );
  AOI22X1 U2723 ( .A(n1933), .B(hwdata[6]), .C(fir_coefficient0[6]), .D(n1932), 
        .Y(n2456) );
  INVX1 U2724 ( .A(N299), .Y(n2455) );
  OAI21X1 U2725 ( .A(n2332), .B(n2457), .C(n2458), .Y(next_fir_coefficient0[5]) );
  AOI22X1 U2726 ( .A(n1933), .B(hwdata[5]), .C(fir_coefficient0[5]), .D(n1932), 
        .Y(n2458) );
  INVX1 U2727 ( .A(N298), .Y(n2457) );
  OAI21X1 U2728 ( .A(n2332), .B(n2459), .C(n2460), .Y(next_fir_coefficient0[4]) );
  AOI22X1 U2729 ( .A(n1933), .B(hwdata[4]), .C(fir_coefficient0[4]), .D(n1932), 
        .Y(n2460) );
  INVX1 U2730 ( .A(N297), .Y(n2459) );
  OAI21X1 U2731 ( .A(n2332), .B(n2461), .C(n2462), .Y(next_fir_coefficient0[3]) );
  AOI22X1 U2732 ( .A(n1933), .B(hwdata[3]), .C(fir_coefficient0[3]), .D(n1932), 
        .Y(n2462) );
  INVX1 U2733 ( .A(N296), .Y(n2461) );
  OAI21X1 U2734 ( .A(n2332), .B(n2463), .C(n2464), .Y(next_fir_coefficient0[2]) );
  AOI22X1 U2735 ( .A(n1933), .B(hwdata[2]), .C(fir_coefficient0[2]), .D(n1932), 
        .Y(n2464) );
  INVX1 U2736 ( .A(N295), .Y(n2463) );
  OAI21X1 U2737 ( .A(n2332), .B(n2465), .C(n2466), .Y(next_fir_coefficient0[1]) );
  AOI22X1 U2738 ( .A(n1933), .B(hwdata[1]), .C(fir_coefficient0[1]), .D(n1932), 
        .Y(n2466) );
  INVX1 U2739 ( .A(N294), .Y(n2465) );
  OAI21X1 U2740 ( .A(n2332), .B(n2467), .C(n2468), .Y(
        next_fir_coefficient0[15]) );
  AOI22X1 U2741 ( .A(n1933), .B(hwdata[15]), .C(fir_coefficient0[15]), .D(
        n1932), .Y(n2468) );
  INVX1 U2742 ( .A(N308), .Y(n2467) );
  OAI21X1 U2743 ( .A(n2332), .B(n2469), .C(n2470), .Y(
        next_fir_coefficient0[14]) );
  AOI22X1 U2744 ( .A(n1933), .B(hwdata[14]), .C(fir_coefficient0[14]), .D(
        n1932), .Y(n2470) );
  INVX1 U2745 ( .A(N307), .Y(n2469) );
  OAI21X1 U2746 ( .A(n2332), .B(n2471), .C(n2472), .Y(
        next_fir_coefficient0[13]) );
  AOI22X1 U2747 ( .A(n1933), .B(hwdata[13]), .C(fir_coefficient0[13]), .D(
        n1932), .Y(n2472) );
  INVX1 U2748 ( .A(N306), .Y(n2471) );
  OAI21X1 U2749 ( .A(n2332), .B(n2473), .C(n2474), .Y(
        next_fir_coefficient0[12]) );
  AOI22X1 U2750 ( .A(n1933), .B(hwdata[12]), .C(fir_coefficient0[12]), .D(
        n1932), .Y(n2474) );
  INVX1 U2751 ( .A(N305), .Y(n2473) );
  OAI21X1 U2752 ( .A(n2332), .B(n2475), .C(n2476), .Y(
        next_fir_coefficient0[11]) );
  AOI22X1 U2753 ( .A(n1933), .B(hwdata[11]), .C(fir_coefficient0[11]), .D(
        n1932), .Y(n2476) );
  INVX1 U2754 ( .A(N304), .Y(n2475) );
  OAI21X1 U2755 ( .A(n2332), .B(n2477), .C(n2478), .Y(
        next_fir_coefficient0[10]) );
  AOI22X1 U2756 ( .A(n1933), .B(hwdata[10]), .C(fir_coefficient0[10]), .D(
        n1932), .Y(n2478) );
  INVX1 U2757 ( .A(N303), .Y(n2477) );
  OAI21X1 U2758 ( .A(n2332), .B(n2479), .C(n2480), .Y(next_fir_coefficient0[0]) );
  AOI22X1 U2759 ( .A(n1933), .B(hwdata[0]), .C(fir_coefficient0[0]), .D(n1932), 
        .Y(n2480) );
  NAND2X1 U2760 ( .A(n2314), .B(n2481), .Y(n2450) );
  OAI21X1 U2761 ( .A(n2446), .B(n2445), .C(prev_hsize), .Y(n2481) );
  NAND3X1 U2762 ( .A(n2316), .B(n2315), .C(n2482), .Y(n2445) );
  AND2X1 U2763 ( .A(n2370), .B(n2320), .Y(n2482) );
  INVX1 U2764 ( .A(n2483), .Y(n2446) );
  NOR2X1 U2765 ( .A(n2317), .B(n2321), .Y(n2449) );
  NAND2X1 U2766 ( .A(n2444), .B(prev_hsize), .Y(n2317) );
  INVX1 U2767 ( .A(n2484), .Y(n2444) );
  INVX1 U2768 ( .A(N293), .Y(n2479) );
  OAI21X1 U2769 ( .A(n2112), .B(n2485), .C(n2486), .Y(next_data_ready) );
  AOI21X1 U2770 ( .A(N292), .B(n1950), .C(n1946), .Y(n2486) );
  NOR2X1 U2771 ( .A(n2321), .B(n2318), .Y(n2115) );
  OR2X1 U2772 ( .A(n2313), .B(n2370), .Y(n2318) );
  INVX1 U2773 ( .A(prev_hsize), .Y(n2313) );
  NOR2X1 U2774 ( .A(n2321), .B(prev_hsize), .Y(n2116) );
  INVX1 U2775 ( .A(n2536), .Y(n2485) );
  OAI21X1 U2776 ( .A(n2488), .B(n2368), .C(prev_hsize), .Y(n2487) );
  NAND2X1 U2777 ( .A(n2489), .B(n2315), .Y(n2368) );
  NAND3X1 U2778 ( .A(n2489), .B(n2370), .C(n2316), .Y(n2315) );
  INVX1 U2779 ( .A(n2488), .Y(n2316) );
  NAND3X1 U2780 ( .A(n2490), .B(n2491), .C(prev_haddr[2]), .Y(n2370) );
  INVX1 U2781 ( .A(n2492), .Y(n2489) );
  NAND3X1 U2782 ( .A(n2483), .B(n2320), .C(n2484), .Y(n2492) );
  NAND3X1 U2783 ( .A(prev_haddr[2]), .B(n2491), .C(prev_haddr[1]), .Y(n2484)
         );
  INVX1 U2784 ( .A(prev_haddr[3]), .Y(n2491) );
  NAND3X1 U2785 ( .A(prev_haddr[3]), .B(prev_haddr[1]), .C(n2493), .Y(n2320)
         );
  NOR2X1 U2786 ( .A(prev_haddr[0]), .B(n2494), .Y(n2493) );
  NAND3X1 U2787 ( .A(n2490), .B(n2494), .C(prev_haddr[3]), .Y(n2483) );
  NAND2X1 U2788 ( .A(n2372), .B(n2371), .Y(n2488) );
  NAND3X1 U2789 ( .A(prev_haddr[1]), .B(n2494), .C(prev_haddr[3]), .Y(n2371)
         );
  INVX1 U2790 ( .A(prev_haddr[2]), .Y(n2494) );
  NAND3X1 U2791 ( .A(prev_haddr[2]), .B(n2490), .C(prev_haddr[3]), .Y(n2372)
         );
  INVX1 U2792 ( .A(prev_haddr[1]), .Y(n2490) );
  INVX1 U2793 ( .A(n2321), .Y(n2314) );
  NAND3X1 U2794 ( .A(prev_hwrite), .B(prev_htrans[1]), .C(n2495), .Y(n2321) );
  NOR2X1 U2795 ( .A(prev_htrans[0]), .B(n2496), .Y(n2495) );
  INVX1 U2796 ( .A(prev_hsel), .Y(n2496) );
  NOR2X1 U2797 ( .A(n2497), .B(modwait), .Y(n2536) );
  INVX1 U2798 ( .A(data_ready), .Y(n2497) );
  INVX1 U2799 ( .A(hwdata[15]), .Y(n2537) );
  INVX1 U2800 ( .A(hwdata[14]), .Y(n2538) );
  INVX1 U2801 ( .A(hwdata[13]), .Y(n2539) );
  INVX1 U2802 ( .A(hwdata[12]), .Y(n2540) );
  INVX1 U2803 ( .A(hwdata[11]), .Y(n2541) );
  INVX1 U2804 ( .A(hwdata[10]), .Y(n2542) );
  INVX1 U2805 ( .A(hwdata[9]), .Y(n2543) );
  INVX1 U2806 ( .A(hwdata[8]), .Y(n2544) );
  INVX1 U2807 ( .A(hwdata[7]), .Y(n2545) );
  INVX1 U2808 ( .A(hwdata[6]), .Y(n2546) );
  INVX1 U2809 ( .A(hwdata[5]), .Y(n2547) );
  INVX1 U2810 ( .A(hwdata[4]), .Y(n2548) );
  INVX1 U2811 ( .A(hwdata[3]), .Y(n2549) );
  INVX1 U2812 ( .A(hwdata[2]), .Y(n2550) );
  INVX1 U2813 ( .A(hwdata[1]), .Y(n2551) );
  INVX1 U2814 ( .A(hwdata[0]), .Y(n2552) );
  NAND2X1 U2815 ( .A(n2498), .B(n2499), .Y(fir_coefficient[9]) );
  AOI22X1 U2816 ( .A(n2500), .B(fir_coefficient2[9]), .C(n2501), .D(
        fir_coefficient3[9]), .Y(n2499) );
  AOI22X1 U2817 ( .A(n1945), .B(fir_coefficient0[9]), .C(n1949), .D(
        fir_coefficient1[9]), .Y(n2498) );
  NAND2X1 U2818 ( .A(n2504), .B(n2505), .Y(fir_coefficient[8]) );
  AOI22X1 U2819 ( .A(n2500), .B(fir_coefficient2[8]), .C(n2501), .D(
        fir_coefficient3[8]), .Y(n2505) );
  AOI22X1 U2820 ( .A(n1945), .B(fir_coefficient0[8]), .C(n1949), .D(
        fir_coefficient1[8]), .Y(n2504) );
  NAND2X1 U2821 ( .A(n2506), .B(n2507), .Y(fir_coefficient[7]) );
  AOI22X1 U2822 ( .A(n2500), .B(fir_coefficient2[7]), .C(n2501), .D(
        fir_coefficient3[7]), .Y(n2507) );
  AOI22X1 U2823 ( .A(n1945), .B(fir_coefficient0[7]), .C(n1949), .D(
        fir_coefficient1[7]), .Y(n2506) );
  NAND2X1 U2824 ( .A(n2508), .B(n2509), .Y(fir_coefficient[6]) );
  AOI22X1 U2825 ( .A(n2500), .B(fir_coefficient2[6]), .C(n2501), .D(
        fir_coefficient3[6]), .Y(n2509) );
  AOI22X1 U2826 ( .A(n1945), .B(fir_coefficient0[6]), .C(n1949), .D(
        fir_coefficient1[6]), .Y(n2508) );
  NAND2X1 U2827 ( .A(n2510), .B(n2511), .Y(fir_coefficient[5]) );
  AOI22X1 U2828 ( .A(n2500), .B(fir_coefficient2[5]), .C(n2501), .D(
        fir_coefficient3[5]), .Y(n2511) );
  AOI22X1 U2829 ( .A(n1945), .B(fir_coefficient0[5]), .C(n1949), .D(
        fir_coefficient1[5]), .Y(n2510) );
  NAND2X1 U2830 ( .A(n2512), .B(n2513), .Y(fir_coefficient[4]) );
  AOI22X1 U2831 ( .A(n2500), .B(fir_coefficient2[4]), .C(n2501), .D(
        fir_coefficient3[4]), .Y(n2513) );
  AOI22X1 U2832 ( .A(n1945), .B(fir_coefficient0[4]), .C(n1949), .D(
        fir_coefficient1[4]), .Y(n2512) );
  NAND2X1 U2833 ( .A(n2514), .B(n2515), .Y(fir_coefficient[3]) );
  AOI22X1 U2834 ( .A(n2500), .B(fir_coefficient2[3]), .C(n2501), .D(
        fir_coefficient3[3]), .Y(n2515) );
  AOI22X1 U2835 ( .A(n1945), .B(fir_coefficient0[3]), .C(n1949), .D(
        fir_coefficient1[3]), .Y(n2514) );
  NAND2X1 U2836 ( .A(n2516), .B(n2517), .Y(fir_coefficient[2]) );
  AOI22X1 U2837 ( .A(n2500), .B(fir_coefficient2[2]), .C(n2501), .D(
        fir_coefficient3[2]), .Y(n2517) );
  AOI22X1 U2838 ( .A(n1945), .B(fir_coefficient0[2]), .C(n1949), .D(
        fir_coefficient1[2]), .Y(n2516) );
  NAND2X1 U2839 ( .A(n2518), .B(n2519), .Y(fir_coefficient[1]) );
  AOI22X1 U2840 ( .A(n2500), .B(fir_coefficient2[1]), .C(n2501), .D(
        fir_coefficient3[1]), .Y(n2519) );
  AOI22X1 U2841 ( .A(n1945), .B(fir_coefficient0[1]), .C(n1949), .D(
        fir_coefficient1[1]), .Y(n2518) );
  NAND2X1 U2842 ( .A(n2520), .B(n2521), .Y(fir_coefficient[15]) );
  AOI22X1 U2843 ( .A(n2500), .B(fir_coefficient2[15]), .C(n2501), .D(
        fir_coefficient3[15]), .Y(n2521) );
  AOI22X1 U2844 ( .A(n1945), .B(fir_coefficient0[15]), .C(n1949), .D(
        fir_coefficient1[15]), .Y(n2520) );
  NAND2X1 U2845 ( .A(n2522), .B(n2523), .Y(fir_coefficient[14]) );
  AOI22X1 U2846 ( .A(n2500), .B(fir_coefficient2[14]), .C(n2501), .D(
        fir_coefficient3[14]), .Y(n2523) );
  AOI22X1 U2847 ( .A(n1945), .B(fir_coefficient0[14]), .C(n1949), .D(
        fir_coefficient1[14]), .Y(n2522) );
  NAND2X1 U2848 ( .A(n2524), .B(n2525), .Y(fir_coefficient[13]) );
  AOI22X1 U2849 ( .A(n2500), .B(fir_coefficient2[13]), .C(n2501), .D(
        fir_coefficient3[13]), .Y(n2525) );
  AOI22X1 U2850 ( .A(n1945), .B(fir_coefficient0[13]), .C(n1949), .D(
        fir_coefficient1[13]), .Y(n2524) );
  NAND2X1 U2851 ( .A(n2526), .B(n2527), .Y(fir_coefficient[12]) );
  AOI22X1 U2852 ( .A(n2500), .B(fir_coefficient2[12]), .C(n2501), .D(
        fir_coefficient3[12]), .Y(n2527) );
  AOI22X1 U2853 ( .A(n1945), .B(fir_coefficient0[12]), .C(n1949), .D(
        fir_coefficient1[12]), .Y(n2526) );
  NAND2X1 U2854 ( .A(n2528), .B(n2529), .Y(fir_coefficient[11]) );
  AOI22X1 U2855 ( .A(n2500), .B(fir_coefficient2[11]), .C(n2501), .D(
        fir_coefficient3[11]), .Y(n2529) );
  AOI22X1 U2856 ( .A(n1945), .B(fir_coefficient0[11]), .C(n1949), .D(
        fir_coefficient1[11]), .Y(n2528) );
  NAND2X1 U2857 ( .A(n2530), .B(n2531), .Y(fir_coefficient[10]) );
  AOI22X1 U2858 ( .A(n2500), .B(fir_coefficient2[10]), .C(n2501), .D(
        fir_coefficient3[10]), .Y(n2531) );
  AOI22X1 U2859 ( .A(n1945), .B(fir_coefficient0[10]), .C(n1949), .D(
        fir_coefficient1[10]), .Y(n2530) );
  NAND2X1 U2860 ( .A(n2532), .B(n2533), .Y(fir_coefficient[0]) );
  AOI22X1 U2861 ( .A(n2500), .B(fir_coefficient2[0]), .C(n2501), .D(
        fir_coefficient3[0]), .Y(n2533) );
  AOI22X1 U2862 ( .A(n1945), .B(fir_coefficient0[0]), .C(n1949), .D(
        fir_coefficient1[0]), .Y(n2532) );
  NOR2X1 U2863 ( .A(n2534), .B(coefficient_num[1]), .Y(n2503) );
  INVX1 U2864 ( .A(coefficient_num[0]), .Y(n2534) );
  NOR2X1 U2865 ( .A(coefficient_num[0]), .B(coefficient_num[1]), .Y(n2502) );
  AND2X1 U2866 ( .A(n2080), .B(hwrite), .Y(N739) );
  NOR2X1 U2867 ( .A(haddr[3]), .B(haddr[2]), .Y(n2080) );
  NOR2X1 U2868 ( .A(n2535), .B(clear_new_coefficient), .Y(N214) );
  INVX1 U2869 ( .A(new_coefficient_set), .Y(n2535) );
endmodule

