--[[
    a.py.lua  —  organised by minimarchbleeding
    Original : Drop56796/if  ->  a.py
    Not obfuscated; reproduced as-is.
--]]

import pygame
import random

# 初始化Pygame
pygame.init()

# 设置屏幕尺寸
screen_width = 800
screen_height = 400
screen = pygame.display.set_mode((screen_width, screen_height))

# 设置游戏时钟
clock = pygame.time.Clock()

# 定义颜色
white = (255, 255, 255)
black = (0, 0, 0)
red = (255, 0, 0)

# 定义玩家角色
player_size = 50
player_x = 100
player_y = screen_height - player_size
player_velocity = 0
gravity = 0.5
jump_power = -10

# 定义障碍物
obstacle_width = 50
obstacle_height = 50
obstacle_x = screen_width
obstacle_y = screen_height - obstacle_height
obstacle_velocity = -7

# 定义游戏主循环
running = True
while running:
    screen.fill(white)

    # 事件处理
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_SPACE and player_y == screen_height - player_size:
                player_velocity = jump_power

    # 玩家角色物理效果
    player_velocity += gravity
    player_y += player_velocity
    if player_y >= screen_height - player_size:
        player_y = screen_height - player_size

    # 障碍物移动
    obstacle_x += obstacle_velocity
    if obstacle_x < 0:
        obstacle_x = screen_width
        obstacle_height = random.randint(20, 100)
        obstacle_y = screen_height - obstacle_height

    # 碰撞检测
    if (player_x < obstacle_x + obstacle_width and player_x + player_size > obstacle_x and
            player_y < obstacle_y + obstacle_height and player_y + player_size > obstacle_y):
        running = False

    # 绘制玩家角色和障碍物
    pygame.draw.rect(screen, black, (player_x, player_y, player_size, player_size))
    pygame.draw.rect(screen, red, (obstacle_x, obstacle_y, obstacle_width, obstacle_height))

    # 刷新屏幕
    pygame.display.update()

    # 设置帧率
    clock.tick(30)

# 退出游戏
pygame.quit()
