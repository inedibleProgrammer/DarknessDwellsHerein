local Colors = {}

function Colors.Init()
  Colors.colorList = {}

  Colors.AddColor("red", 1, "00FF0303")
  Colors.AddColor("blue", 2, "000042FF")
  Colors.AddColor("teal", 3, "001CE6B9")
  Colors.AddColor("purple", 4, "00540081")
  Colors.AddColor("yellow", 5, "00FFFC00")
  Colors.AddColor("orange", 6, "00FE8A0E")
  Colors.AddColor("green", 7, "0020C000")
  Colors.AddColor("pink", 8, "00E55BB0")
  Colors.AddColor("gray", 9, "00959697")
  Colors.AddColor("light_blue", 10, "007EBFF1")
  Colors.AddColor("dark_green", 11, "00106246")
  Colors.AddColor("brown", 12, "004E2A04")
  Colors.AddColor("maroon", 13, "009B0000")
  Colors.AddColor("navy", 14, "000000C3")
  Colors.AddColor("turquoise", 15, "0000EAFF")
  Colors.AddColor("violet", 16, "00BE00FE")
  Colors.AddColor("wheat", 17, "00EBCD87")
  Colors.AddColor("peach", 18, "00F8A48B")
  Colors.AddColor("mint", 19, "00BFFF80")
  Colors.AddColor("lavender", 20, "00DCB9EB")
  Colors.AddColor("coal", 21, "00282828")
  Colors.AddColor("snow", 22, "00EBF0FF")
  Colors.AddColor("emerald", 23, "0000781E")
  Colors.AddColor("peanut", 24, "00A46F33")
  Colors.AddColor("some_weird_green", 25, "0022744F")
  Colors.AddColor("gold", 26, "00FFD700")
  Colors.AddColor("bright_blue", 27, "0019CAF6")
end

function Colors.Create(text, number, hexCode)
  local this = {}
  this.text = text
  this.number = number
  this.hexCode = hexCode

  return this
end

function Colors.AddColor(colorname, number, hexCode)
  local color = Colors.Create(colorname, number, hexCode)
  table.insert(Colors.colorList, color)
end
