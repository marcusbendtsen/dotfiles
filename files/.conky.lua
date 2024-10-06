
--
-- Detec cpu cores and create Conky syntax for displaying cores
-- 
local file = io.popen("grep -c processor /proc/cpuinfo")
local numcpus = file:read("*n")
file:close()
listcpus = "Average CPU usage: ${cpu cpu0}%\n"
listcpus = listcpus.."${cpugraph cpu0 ff8300 FFFDE2 10 -t -l}\n"
for i = 1,numcpus do
   cpuname = "cpu"..tostring(i)
   if i < 10 then
      listcpus = listcpus.."Core "..tostring(i).."  ${freq_g "..cpuname.."}GHz ${color ff8300}${cpubar "..cpuname.." 6}${color FFFDE2}\n"
   else
      listcpus = listcpus.."Core "..tostring(i).." ${freq_g "..cpuname.."}GHz ${color ff8300}${cpubar "..cpuname.." 6}${color FFFDE2}\n"
   end
end

--
-- Return cpu core syntax
--
function conky_cpu_output()
   return listcpus
end
