import {createRoot} from "react-dom/client";
import {useState} from "react";
 
function EmailForm() {
  
    const [email, setEmail] = useState("");
    const [error, setError] = useState("");
  
    const handleChange = (e) => {
  
         
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        setEmail(e.target.value);

        if (!emailRegex.test(email)) {

            setError("Invalid email address");
        }

        else setError(""); 
    };
  
    return (
        <div>
            <input type="email" value={email} onChange={handleChange} placeholder="Email" />
            {error? <p style={{ color: "red" }}>{error}</p>: <p style={{ color: "green" }}>{email}</p>}
        </div>
    );
}
 
createRoot(
    document.getElementById("app")
)
.render(
    <EmailForm />
);