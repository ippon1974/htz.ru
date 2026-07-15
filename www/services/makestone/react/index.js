function MyComponent() {
            const greeting = "Привет Вован это тест JSX";
            return (
                <div className="container">
                    <h1>{greeting}</h1>
                    <p>This is JSX running directly inside an HTML file.</p>
                </div>
            );
        }
        // Render the component into the DOM container
        const container = document.getElementById('root');
        const root = ReactDOM.createRoot(container);
        root.render(<MyComponent />);