return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",      -- LSP источник
    "hrsh7th/cmp-buffer",         -- Буфер источник
    "hrsh7th/cmp-path",           -- Путь источник
    "hrsh7th/cmp-cmdline",        -- Командная строка
    "L3MON4D3/LuaSnip",           -- Сниппеты
    "saadparwaiz1/cmp_luasnip",   -- Сниппеты источник
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
      -- Настройки сниппетов
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- Настройки клавиш
      mapping = cmp.mapping.preset.insert({
        -- Подтверждение выбранного пункта
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        
        -- Переход к следующему/предыдущему пункту
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        
        -- Листание документации
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        
        -- Открыть меню и завершить
        ['<C-Space>'] = cmp.mapping.complete(),
        
        -- Закрыть меню
        ['<C-e>'] = cmp.mapping.abort(),
      }),

      -- Источники автодополнения
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },      -- LSP
        { name = 'luasnip' },       -- Сниппеты
        { name = 'buffer' },        -- Текст из буфера
        { name = 'path' },          -- Пути к файлам
      }, {
        { name = 'buffer' },
      }),

      -- Настройки внешнего вида (без иконок)
      formatting = {
        format = function(entry, vim_item)
          -- Добавляем только имя источника
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snip]",
            buffer = "[Buf]",
            path = "[Path]",
          })[entry.source.name]
          
          return vim_item
        end
      },

      -- Экспериментальные настройки
      experimental = {
        ghost_text = true, -- Призрачный текст
      },
    })

    -- Дополнительные настройки для командной строки
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
  end,
}
