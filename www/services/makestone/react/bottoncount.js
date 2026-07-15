// 1. Деструктурируем useState из глобального объекта React
        const { useState } = React;

        // 2. Создаем компонент
        function Counter() {
            // Используем useState: начальное значение равно 0
            const [count, setCount] = useState(0);

            return (
                <div>
                    <p>Вы нажали {count} раз(а)</p>
                    {/* Кнопка для обновления состояния */}
                    <button onClick={() => setCount(count + 1)}>
                        Нажми меня
                    </button>
                </div>
            );
        }

        // 3. Монтируем компонент в DOM
        const root = ReactDOM.createRoot(document.getElementById('root'));
        root.render(<Counter />);