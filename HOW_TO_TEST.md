# Как проверить изменения

## 1. Просмотр созданных файлов

### В терминале:
```bash
# Список всех созданных файлов
ls -lh *.scad *.md

# Просмотр структуры проекта
tree -L 2

# Или просто
ls -la
```

### Созданные файлы:
- `container_design_improved.scad` (25 KB) - Улучшенный модуль контейнера
- `OPTIMIZATION_GUIDE.md` (9.6 KB) - Руководство по оптимизации
- `EXAMPLES.md` (11 KB) - Примеры использования
- `HOW_TO_TEST.md` (этот файл) - Инструкция по тестированию

## 2. Просмотр коммита в Git

```bash
# Показать последний коммит с деталями
git show HEAD

# Показать статистику изменений
git show --stat HEAD

# Показать список файлов в коммите
git diff-tree --no-commit-id --name-only -r HEAD

# Просмотр истории
git log --oneline --graph --all -10
```

## 3. Чтение документации

### В терминале:
```bash
# Прочитать руководство по оптимизации
cat OPTIMIZATION_GUIDE.md

# Прочитать примеры использования
cat EXAMPLES.md

# Прочитать начало улучшенного скрипта
head -100 container_design_improved.scad
```

### В текстовом редакторе:
```bash
# Используйте ваш любимый редактор
nano OPTIMIZATION_GUIDE.md
# или
vim OPTIMIZATION_GUIDE.md
# или
code OPTIMIZATION_GUIDE.md  # VS Code
```

## 4. Проверка в OpenSCAD

### Если у вас установлен OpenSCAD:

1. **Графический интерфейс:**
   ```bash
   openscad container_design_improved.scad
   ```

2. **Командная строка (предпросмотр):**
   ```bash
   openscad -o preview.png --preview --imgsize=1920,1080 container_design_improved.scad
   ```

3. **Рендеринг в STL:**
   ```bash
   openscad -o container.stl container_design_improved.scad
   ```

### Быстрый тест синтаксиса:
```bash
# Проверка синтаксиса без рендеринга
openscad --check-syntax container_design_improved.scad
```

## 5. Сравнение с оригиналом

### Если у вас есть оригинальный файл:

```bash
# Посчитать строки кода
wc -l original.scad container_design_improved.scad

# Сравнить структуру (показать только функции)
grep "^function" original.scad
grep "^function" container_design_improved.scad

# Сравнить модули
grep "^module" original.scad
grep "^module" container_design_improved.scad
```

## 6. Тестирование функций

### Создайте тестовый файл `test.scad`:

```openscad
use <container_design_improved.scad>

// Тест 1: Проверка базы данных
db = create_profile_database();
echo("Database entries:", len(db));

// Тест 2: Получение параметров профиля
h = get_profile_param("Швеллер", "12П", "h");
echo("Channel 12П height:", h);

// Тест 3: Генерация координат
coords = generate_coords(7000, 1250);
echo("Generated coordinates:", coords);

// Тест 4: Выбор стали
steel = select_steel_type(-60);
echo("Steel type for -60°C:", steel);

// Тест 5: Визуализация
simplified_container();
```

Запустите:
```bash
openscad test.scad
```

## 7. Проверка примеров из EXAMPLES.md

### Пример 1: Стандартный контейнер
```bash
# Создайте файл example1.scad
cat > example1.scad << 'EOF'
use <container_design_improved.scad>

container_length = 7000;
container_width = 3000;
container_height = 2500;
container_type = "ПБК";
sandwich_thickness = 100;

simplified_container();
EOF

# Запустите
openscad example1.scad
```

### Пример 2: Сравнение размеров профилей
```bash
cat > example2.scad << 'EOF'
use <container_design_improved.scad>

sizes = ["10П", "12П", "14П", "16П"];

for (i = [0 : len(sizes) - 1]) {
    translate([i * 200, 0, 0])
    profile_detail(
        material = "Швеллер",
        size = sizes[i],
        length = 1000
    );
}
EOF

openscad example2.scad
```

## 8. Проверка производительности

### Сравнение времени рендеринга:

```bash
# С низким разрешением
time openscad -o test_low.png --preview --imgsize=800,600 \
  -D '$fn=20' container_design_improved.scad

# С высоким разрешением
time openscad -o test_high.png --preview --imgsize=800,600 \
  -D '$fn=100' container_design_improved.scad
```

## 9. Извлечение статистики кода

```bash
# Количество строк кода
wc -l container_design_improved.scad

# Количество функций
grep -c "^function" container_design_improved.scad

# Количество модулей
grep -c "^module" container_design_improved.scad

# Количество комментариев
grep -c "^//" container_design_improved.scad

# Список всех функций
grep "^function" container_design_improved.scad | sed 's/function //' | sed 's/(.*$//'
```

## 10. Проверка через веб-интерфейс GitHub

1. Откройте GitHub в браузере
2. Перейдите в ваш репозиторий
3. Выберите ветку: `claude/container-design-module-011CUUubnQJb9uQ1EmAwqszM`
4. Просмотрите файлы и коммит

## 11. Экспорт для документации

### Экспорт в PDF (если есть pandoc):
```bash
pandoc OPTIMIZATION_GUIDE.md -o OPTIMIZATION_GUIDE.pdf
pandoc EXAMPLES.md -o EXAMPLES.pdf
```

### Экспорт скриншотов:
```bash
# Различные виды контейнера
openscad -o view_front.png --camera=0,0,0,55,0,25,5000 \
  --preview --imgsize=1920,1080 container_design_improved.scad

openscad -o view_top.png --camera=0,0,0,0,0,90,5000 \
  --preview --imgsize=1920,1080 container_design_improved.scad

openscad -o view_iso.png --camera=1,1,1,55,0,45,5000 \
  --preview --imgsize=1920,1080 container_design_improved.scad
```

## 12. Валидация изменений

### Проверьте, что все работает:

```bash
# Создайте тестовый скрипт
cat > validate.scad << 'EOF'
use <container_design_improved.scad>

// Тест всех основных функций
db = create_profile_database();
assert(len(db) > 0, "Database is empty!");

h = get_profile_param("Швеллер", "12П", "h");
assert(h == 120, "Profile parameter incorrect!");

coords = generate_coords(7000, 1250);
assert(len(coords) > 0, "Coordinate generation failed!");

steel = select_steel_type(-60);
assert(steel != undef, "Steel selection failed!");

echo("✓ All validation tests passed!");

// Отрисовка контейнера
simplified_container();
EOF

# Запустите валидацию
openscad validate.scad
```

## Что искать при проверке

✅ **Правильность работы:**
- Код компилируется без ошибок
- Функции возвращают ожидаемые значения
- Визуализация корректна

✅ **Улучшения структуры:**
- Код разделен на логические секции
- Функции имеют понятные имена
- Есть комментарии и документация

✅ **Производительность:**
- Предпросмотр работает быстро ($fn=20-50)
- Финальный рендер детален ($fn=100-200)

✅ **Документация:**
- OPTIMIZATION_GUIDE.md описывает все улучшения
- EXAMPLES.md содержит рабочие примеры
- Комментарии в коде понятны

## Быстрая проверка "все в одном"

```bash
#!/bin/bash
echo "=== Quick Validation Script ==="

echo "1. Checking files..."
ls -lh *.scad *.md

echo -e "\n2. Checking syntax..."
if command -v openscad &> /dev/null; then
    openscad --check-syntax container_design_improved.scad
    echo "✓ Syntax OK"
else
    echo "⚠ OpenSCAD not installed"
fi

echo -e "\n3. Code statistics..."
echo "  Lines: $(wc -l < container_design_improved.scad)"
echo "  Functions: $(grep -c '^function' container_design_improved.scad)"
echo "  Modules: $(grep -c '^module' container_design_improved.scad)"

echo -e "\n4. Documentation files..."
echo "  Optimization Guide: $(wc -l < OPTIMIZATION_GUIDE.md) lines"
echo "  Examples: $(wc -l < EXAMPLES.md) lines"

echo -e "\n✓ Validation complete!"
```

Сохраните как `quick_check.sh` и запустите:
```bash
chmod +x quick_check.sh
./quick_check.sh
```

---

## Следующие шаги

После проверки изменений:

1. **Если все работает:** можно создать Pull Request
2. **Если нужны правки:** внесите изменения и закоммитьте
3. **Для production:** добавьте оставшиеся детали (двери, крышу, и т.д.)

## Контакты для вопросов

Если найдете проблемы или у вас есть вопросы:
- Создайте issue в GitHub репозитории
- Опишите проблему с примером кода
- Приложите скриншоты, если возможно
