library(ggplot2)
library(scales)
library(svglite)
str(data_2)
data_1 = read.csv("trial_1.csv")
data_1 = data_1[-(1:2138),(1:3)]
colnames(data_1) = c("Time", "Displacement", "Force")
data_1$Time = as.numeric(as.character(data_1$Time))
data_1$Displacement = as.numeric(as.character(data_1$Displacement))
data_1$Force = as.numeric(as.character(data_1$Force))
data_1$Tensile_Strain = data_1$Displacement/14.22
data_1$Tensile_Stress = data_1$Force/(1.58*0.83)
data_1$trial = "1"
plot(data_1$Tensile_Strain, data_1$Tensile_Stress)

data_2 = read.csv("trial_2.csv")
data_2 = data_2[-(1:2138),(1:3)]
colnames(data_2) = c("Time", "Displacement", "Force")
data_2$Time = as.numeric(as.character(data_2$Time))
data_2$Displacement = as.numeric(as.character(data_2$Displacement))
data_2$Force = as.numeric(as.character(data_2$Force))
data_2$Tensile_Strain = data_2$Displacement/16.02
data_2$Tensile_Stress = data_2$Force/(1.53*0.9)
data_2$trial = "2"

data_3 = read.csv("trial_3.csv")
data_3 = data_3[-(1:2138),(1:3)]
colnames(data_3) = c("Time", "Displacement", "Force")
data_3$Time = as.numeric(as.character(data_3$Time))
data_3$Displacement = as.numeric(as.character(data_3$Displacement))
data_3$Force = as.numeric(as.character(data_3$Force))
data_3$Tensile_Strain = data_3$Displacement/10.68
data_3$Tensile_Stress = data_3$Force/(1.58*0.95)
data_3$trial = "3"

data_4 = read.csv("trial_4.csv")
data_4 = data_4[-(1:2138),(1:3)]
colnames(data_4) = c("Time", "Displacement", "Force")
data_4$Time = as.numeric(as.character(data_4$Time))
data_4$Displacement = as.numeric(as.character(data_4$Displacement))
data_4$Force = as.numeric(as.character(data_4$Force))
data_4$Tensile_Strain = data_4$Displacement/11.87
data_4$Tensile_Stress = data_4$Force/(1.55*0.95)
data_4$trial = "4"

subtotal = rbind(data_1, data_3)
total = rbind(subtotal, data_4)


ggplot(total) +
  geom_path(aes(x = Tensile_Strain, y = Tensile_Stress, color = trial), size = 1) +
  scale_color_manual(name = "Trial",
                     limits = c("1", "3", "4"),
                     values = c("#D47500", "#6EB43F", "#073949")) +
  labs(x = "Strain (mm/mm)", y = "Stress (kPa)") +
  scale_x_continuous(limits = c(0,0.75), n.breaks = 4, labels = scales::percent) +
  theme_classic() +
  #annotate("text", x = 0.225, y = 225, label = "Trial 1", color = "#006699", size = 4, fontface = "bold") +
  #annotate("text", x = 0.2, y = 225, label = "Trial 2", color = "#6EB43F", size = 4, fontface = "bold") +
  #annotate("text", x = 0.25, y = 225, label = "Trial 3", color = "#F8981D", size = 4, fontface = "bold") +
  #annotate("text", x = 0.25, y = 225, label = "Trial 3", color = "#073949", size = 4, fontface = "bold") +
  theme(
    axis.text.x = element_text(size=10, color = "black", face = "bold"),
    axis.text.y = element_text(size=10, color = "black", face = "bold"),
    axis.title = element_text(size=10, color = "black", face = "bold"),
    legend.title = element_text(size=10, color = "black", face = "bold"),
    legend.text = element_text(size=10, color = "black", face = "bold"),
    legend.position = "none")
ggsave("tension.svg", width = 50, height = 50, units = "mm")
levels(processed$Cycle)