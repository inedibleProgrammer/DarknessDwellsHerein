local StringUtil = {}


function StringUtil.Split(inputStr, sep)
  if sep == nil then
    sep = " "
  end
  local t = {}
  for str in string.gmatch(inputStr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end
