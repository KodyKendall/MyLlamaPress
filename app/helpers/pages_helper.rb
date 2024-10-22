module PagesHelper
    def self.starting_html_content
        <<~HTML
<!DOCTYPE html><html lang="en"><head data-llama-id="0">
    <meta charset="UTF-8" data-llama-id="1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" data-llama-id="2">
    <title data-llama-id="3">LlamaPress - AI-Powered Growth Engine for Small Business</title>
    <link rel="icon" type="image/png" href="https://service-jobs-images.s3.us-east-2.amazonaws.com/7rl98t1weu387r43il97h6ipk1l7" data-llama-id="4">
    <script src="https://cdn.tailwindcss.com" data-llama-id="5"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&amp;display=swap" rel="stylesheet" data-llama-id="6">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" data-llama-id="7">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" data-llama-id="8">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js" data-llama-id="9"></script>
    <style data-llama-id="10">
        body {
            font-family: 'Poppins', sans-serif;
        }
        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .feature-icon {
            width: 48px;
            height: 48px;
            font-size: 24px;
            background-color: #667eea;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body class="bg-gray-100" data-llama-id="11" data-aos-easing="ease" data-aos-duration="1000" data-aos-delay="0">
    <header class="gradient-bg text-white py-16" data-llama-id="12">
        <div class="container mx-auto text-center" data-llama-id="13">
            <img src="https://service-jobs-images.s3.us-east-2.amazonaws.com/7rl98t1weu387r43il97h6ipk1l7" alt="LlamaPress Logo" class="h-40 mx-auto mb-8 aos-init aos-animate" data-aos="zoom-in" data-llama-id="14">
            <h1 class="text-5xl font-bold mb-4 aos-init aos-animate" data-aos="fade-up" data-aos-delay="200" data-llama-id="15">Welcome to LlamaPress 🦙</h1>
            <h2 class="text-2xl mb-8 aos-init aos-animate" data-aos="fade-up" data-aos-delay="400" data-llama-id="16">Build Websites with a Chatbot</h2>
            <a href="javascript:void(0)" onclick="toggleChat()" class="bg-white text-indigo-600 font-semibold py-3 px-8 rounded-full hover:bg-indigo-100 transition duration-300 aos-init aos-animate" data-aos="fade-up" data-aos-delay="600" data-llama-id="17">Get Started</a>
        </div>
    </header>

    <section class="bg-white rounded-lg shadow-lg p-8 mb-12 text-center aos-init aos-animate" data-aos="fade-up" data-llama-id="18">
        <h3 class="text-2xl font-bold mb-6" data-llama-id="19">LlamaPress Tutorial</h3>
        <div class="flex justify-center" data-llama-id="20">
            <img src="https://service-jobs-images.s3.us-east-2.amazonaws.com/1ws6omjel5kus3akeqoflvp8eje4" alt="LlamaPress Tutorial" class="w-full max-w-4xl rounded-lg shadow-md aos-init aos-animate" data-aos="zoom-in" data-llama-id="21">
        </div>
        <p class="mt-6 text-gray-600 max-w-2xl mx-auto" data-llama-id="22">Follow these steps to make the most out of LlamaPress and enhance your website effortlessly.</p>
    </section>

    <main class="container mx-auto px-4 py-16" data-llama-id="23">
        <section id="tutorial" class="bg-white rounded-lg shadow-lg p-8 mb-12 aos-init aos-animate" data-aos="fade-up" data-llama-id="24">
            <h2 class="text-3xl font-bold mb-8 text-center" data-llama-id="25">How to Use LlamaPress: Step-by-Step Tutorial</h2>
            <ol class="space-y-6" data-llama-id="26">
                <li class="flex items-start" data-llama-id="27">
                    <div class="flex-shrink-0" data-llama-id="28" data-llama-editable="true">
                        <div class="w-12 h-12 md:w-16 md:h-16 bg-blue-500 rounded-full flex items-center justify-center cursor-pointer" data-llama="app/views/shared/_chat.html.erb">
                            <img src="https://service-jobs-images.s3.us-east-2.amazonaws.com/7rl98t1weu387r43il97h6ipk1l7" alt="LlamaPress Logo" class="h-8 w-8 md:h-12 md:w-12 llama-prevent-img-resize" data-llama="app/views/shared/_chat.html.erb">
                        </div>
                    </div>
                    <div class="ml-4" data-llama-id="31">
                        <h3 class="text-2xl font-semibold mb-2" data-llama-id="32">1. Click on our Chatbot (LlamaBot)</h3>
                        <p class="text-gray-700" data-llama-id="33">Locate the LlamaBot icon at the bottom right corner of your screen and click on it to open the chat window.</p>
                    </div>
                </li>
                <li class="flex items-start" data-llama-id="34">
                    <div class="flex-shrink-0" data-llama-id="35">
                        <div class="feature-icon bg-green-600" data-llama-id="36">
                            <i class="fas fa-question" data-llama-id="37"></i>
                        </div>
                    </div>
                    <div class="ml-4" data-llama-id="38">
                        <h3 class="text-2xl font-semibold mb-2" data-llama-id="39">2. Ask LlamaBot for Changes</h3>
                        <p class="text-gray-700" data-llama-id="40">Type in the changes you want to implement on your page and let LlamaBot assist you with the modifications.</p>
                    </div>
                </li>
                <li class="flex items-start" data-llama-id="41">
                    <div class="flex-shrink-0" data-llama-id="42">
                        <div class="feature-icon bg-yellow-600" data-llama-id="43">
                            <i class="fas fa-mouse-pointer" data-llama-id="44"></i>
                        </div>
                    </div>
                    <div class="ml-4" data-llama-id="45">
                        <h3 class="text-2xl font-semibold mb-2" data-llama-id="46">3. Use the Pointing Tool</h3>
                        <p class="text-gray-700" data-llama-id="47">Click on the pointing tool to select a specific element you wish to change, then instruct LlamaBot to make the desired modifications.</p>
                    </div>
                </li>
                <li class="flex items-start" data-llama-id="48">
                    <div class="flex-shrink-0" data-llama-id="49">
                        <div class="feature-icon bg-red-600" data-llama-id="50">
                            <i class="fas fa-keyboard" data-llama-id="51"></i>
                        </div>
                    </div>
                    <div class="ml-4" data-llama-id="52">
                        <h3 class="text-2xl font-semibold mb-2" data-llama-id="53">4. Keyboard Shortcuts</h3>
                        <ul class="list-disc list-inside text-gray-700" data-llama-id="54">
                            <li data-llama-id="55"><span class="font-semibold" data-llama-id="56">Escape Key:</span> Open the LlamaBot window.</li>
                            <li data-llama-id="57"><span class="font-semibold" data-llama-id="58">CMD + L:</span> Copy the selected element to the chat window.</li>
                            <li data-llama-id="59"><span class="font-semibold" data-llama-id="60">Option + C:</span> Toggle the Pointing Tool.</li>
                            <li data-llama-id="61"><span class="font-semibold" data-llama-id="62">Ctrl + Z:</span> Undo the last change made by LlamaBot.</li>
                            <li data-llama-id="63"><span class="font-semibold" data-llama-id="64">Ctrl + Shift + Z:</span> Redo the last change from LlamaBot.</li>
                            <li data-llama-id="65"><span class="font-semibold" data-llama-id="66">Shift + Enter:</span> Create a new line in the chat window.</li>
                        </ul>
                    </div>
                </li>
                <li class="flex items-start" data-llama-id="67">
                    <div class="flex-shrink-0" data-llama-id="68">
                        <div class="feature-icon bg-purple-600" data-llama-id="69">
                            <i class="fas fa-undo" data-llama-id="70"></i>
                        </div>
                    </div>
                    <div class="ml-4" data-llama-id="71">
                        <h3 class="text-2xl font-semibold mb-2" data-llama-id="72">5. Undo and Redo Changes</h3>
                        <p class="text-gray-700" data-llama-id="73">Easily revert or reapply changes using the keyboard shortcuts to maintain full control over your website's appearance.</p>
                    </div>
                </li>
                <li class="flex items-start" data-llama-id="74">
                    <div class="flex-shrink-0" data-llama-id="75">
                        <div class="feature-icon bg-pink-600" data-llama-id="76">
                            <i class="fas fa-code" data-llama-id="77"></i>
                        </div>
                    </div>
                    <div class="ml-4" data-llama-id="78">
                        <h3 class="text-2xl font-semibold mb-2" data-llama-id="79">6. Advanced Customization</h3>
                        <p class="text-gray-700" data-llama-id="80">Use keyboard shortcuts in combination with LlamaBot to perform advanced customizations and streamline your workflow.</p>
                    </div>
                </li>
                <li class="flex items-start" data-llama-id="81">
                    <div class="flex-shrink-0" data-llama-id="82">
                        <div class="feature-icon bg-indigo-600" data-llama-id="83">
                            <i class="fas fa-terminal" data-llama-id="84"></i>
                        </div>
                    </div>
                    <div class="ml-4" data-llama-id="85">
                        <h3 class="text-2xl font-semibold mb-2" data-llama-id="86">7. Efficient Workflow</h3>
                        <p class="text-gray-700" data-llama-id="87">Utilize the provided shortcuts and tools to create a seamless and efficient workflow, allowing you to focus on growing your business.</p>
                    </div>
                </li>
            </ol>
        </section>
    </main>

    <footer class="gradient-bg text-white py-8" data-llama-id="88">
        <div class="container mx-auto text-center" data-llama-id="89">
            <span class="text-xl font-semibold" data-llama-id="90">Built with LlamaPress</span>
            <img src="https://service-jobs-images.s3.us-east-2.amazonaws.com/7rl98t1weu387r43il97h6ipk1l7" alt="LlamaPress Logo" class="inline-block ml-4 h-10" data-llama-id="91">
        </div>
    </footer>

    <script data-llama-id="92">
        AOS.init({
            duration: 1000,
            once: true,
        });
    </script></body></html>
        HTML
    end
end