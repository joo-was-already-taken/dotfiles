local quotes = {
  {
    quote = {
      "A man on a horse is spiritually as well as physically bigger",
      "then a man on foot.",
    },
    author = "John Steinbeck",
  },
  {
    quote = {
      "Everything has its limit - iron ore cannot be educated into gold.",
    },
    author = "Mark Twain",
  },
  {
    quote = {
      "I cannot imagine any condition which would cause a ship to founder...",
      "Modern shipbuilding has gone beyond that.",
    },
    author = "Capt. E.J. Smith, RMS Titanic",
  },
  {
    quote = {
      "If I were again beginning my studies, I would follow the advice of Plato",
      "and start with mathematics.",
    },
    author = "Galileo Galilei",
  },
  {
    quote = {
      "One man's 'magic' is another man's engineering.",
    },
    author = "Robert Heinlein",
  },
  {
    quote = {
      "If there are no dogs in Heaven,",
      "then when I die I want to go where they went.",
    },
    author = "Will Rogers",
  },
  {
    quote = {
      "I am fond of pigs.",
      "Dogs look up to us. Cats look down on us.",
      "Pigs treat us as equals.",
    },
    author = "Winston S. Churchill",
  },
  {
    quote = {
      "Vessels large may venture more,",
      "but little boats should keep near shore.",
    },
    author = "Benjamin Franklin",
  },
  {
    quote = {
      "I shot an arrow into the air.",
      "It fell to earth,",
      "I knew not where.",
    },
    author = "Henry Wadsworth Longfellow",
  },
  {
    quote = {
      "Writing is easy.",
      "All you have to do is cross out the wrong words.",
    },
    author = "Mark Twain",
  },
  {
    quote = {
      "When wasteful war shall statues overturn,",
      "And broils root out the work of masonry,",
      "Nor Mars his sword, nor war's quick fire shall burn",
      "The living record of your memory.",
    },
    author = "William Shakespeare",
  },
  {
    quote = {
      "And all I ask is a tall ship and a star to steer her by.",
    },
    author = "John Masefield",
  },
  {
    quote = {
      "Normal people ... believe that if it ain't broke, don't fix it.",
      "Engineers believe that if it ain't broke,",
      "it doesn't have enough features yet.",
    },
    author = "Scott Adams",
  },
  {
    quote = {
      "Betwixt the stirrup and the ground,",
      "Mercy I asked, mercy I found.",
    },
    author = "William Camden",
  },
  {
    quote = {
      "Blast - Build - Battle",
    },
    author = "Motto of the U.S. 16th Engineers Brigade",
  },
  {
    quote = {
      "I saw a bank that said '24-Hour Banking',",
      "but I didn't have that much time",
    },
    author = "Steven Wright",
  },
  {
    quote = {
      "Astronomy's much more fun when you're not an astronomer.",
    },
    author = "Brian May",
  },
  {
    quote = {
      "You and I come by road or rail,",
      "but economists travel on infrastructure.",
    },
    author = "Margaret Thatcher",
  },
  {
    quote = {
      "It was luxuries like air conditioning that brought down the Roman Empire.",
      "With air conditioning their windows were shut;",
      "they couldn’t hear the barbarians coming.",
    },
    author = "Garrison Keillor",
  },
  {
    quote = {
      "All that glisters is not gold",
      "often have you heard that told.",
    },
    author = "William Shakespeare",
  },
  {
    quote = {
      "Listen, strange women lying in ponds distributing swords",
      "is no basis for a system of government ...",
      "You can’t expect to wield supreme power",
      "just 'cause some watery tart threw a sword at you!",
    },
    author = "Monty Python",
  },
  {
    quote = {
      "Opera is when a guy gets stabbed in the back",
      "and instead of bleeding, he sings.",
    },
    author = "Robert Benchley",
  },
}

local neovim = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

local align_center = function(lines)
  local max = function(tbl)
    local max_val = tbl[1]
    for _, val in pairs(tbl) do
      if val > max_val then
        max_val = val
      end
    end
    return max_val
  end

  local lengths = {}
  for _, line in ipairs(lines) do
    table.insert(lengths, #line)
  end

  local max_length = max(lengths)
  local aligned_lines = {}

  for _, line in ipairs(lines) do
    if #line ~= 0 then
      local pad_length = (max_length - #line) / 2
      local pad = string.rep(" ", pad_length)
      local aligned_line = pad .. line
      table.insert(aligned_lines, aligned_line)
    else
      table.insert(aligned_lines, "")
    end
  end

  return aligned_lines
end

local config = function()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")

  math.randomseed(os.time())
  local quote = quotes[math.random(#quotes)]
  local joined_quote = neovim

  table.insert(joined_quote, "")
  table.insert(joined_quote, "")
  table.insert(joined_quote, [[¯\_(ツ)_/¯]])
  table.insert(joined_quote, "")
  table.insert(joined_quote, "")
  table.insert(joined_quote, "")

  for _, line in ipairs(quote.quote) do
    table.insert(joined_quote, line)
  end
  table.insert(joined_quote, "")
  table.insert(joined_quote, "~~ " .. quote.author .. " ~~")

  dashboard.section.header.val = align_center(joined_quote)

  -- Position vertically
  local margin_top_percent = 0.3
  local header_padding = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * margin_top_percent) })

  dashboard.config.layout = {
    { type = "padding", val = header_padding },
    dashboard.section.header,
    { type = "padding", val = 2 },
    -- dashboard.section.buttons,
    dashboard.section.footer,
  }

  alpha.setup(dashboard.config)
end

return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = config,
}
