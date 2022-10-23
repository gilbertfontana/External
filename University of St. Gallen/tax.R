



#### Libs ####
library(tidyverse)
library(showtext)
library(MetBrewer)

#### DATA ####
df <- read_csv("https://raw.githubusercontent.com/gilbertfontana/External/main/University%20of%20St.%20Gallen/tax_data.csv")

#### STYLE ####
font <- "Oswald"
font_add_google(family=font, font, db_cache = FALSE)
showtext_auto(enable = TRUE) 
theme_set(theme_minimal(base_family = font))
bg <- "#334756"
txt_col <- "black"

#### PLOT ####
df %>% 
  ggplot(aes(x=year, y=centaxgdp, group=country)) +
  geom_line(aes(color=country)) +
  geom_point(data = df %>% filter(year=="2020"),
             aes(color=country)) +
  geom_text(data = df %>% filter(year=="2020"),
            aes(label=country, color=country),
            hjust = -.2,
            family=font,
            size=4) +
  coord_cartesian(clip = "off") +
  scale_color_manual(values = met.brewer(name = "Paquin", type = "discrete",n=4)) +
  scale_x_continuous(expand = expansion(mult = 0.1)) +
  scale_y_continuous(limits = c(0,40), expand = c(0,0)) +
  xlab("") +
  ylab("Central government tax revenue as a share of GDP (%)") +
  labs(title = "The Rise of the\nNordic Welfare States",
       caption ="Gilbert Fontana | Data: Andersson & Brambor (2019) and Eurostat"
  ) +
  theme(
    panel.grid = element_blank(),
    axis.text = element_text(color="#DEA2A2", size=10),
    axis.title = element_text(color="#DEA2A2", size=12),
    plot.title = element_text(size=36, hjust=.5, color="#DEA2A2",face = "bold", margin = margin(0,0,30,0)),
    plot.caption = element_text(hjust=.5, color="#DEA2A2"),
    legend.position = "none",
    plot.background = element_rect(fill = bg, color = bg),
    plot.margin = margin(30, 30, 30, 30)
  )


# Save
showtext_opts(dpi = 320) 

ggsave("tax.png",
       height = 8,
       width = 10,
       dpi=320,
       
)  


  

