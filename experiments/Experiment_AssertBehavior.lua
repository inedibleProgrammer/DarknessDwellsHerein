
function TestAssert()
  assert(false, "this is what false looks like")
end


function LaunchLua()
  -- assert(false, "this is what false looks like")
  xpcall(TestAssert, print)
end
