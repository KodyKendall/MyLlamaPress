module PagesHelper
    def self.starting_html_content
        <<~HTML
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>LlamaPress - AI-Powered Growth Engine for Small Business</title>
                <link rel="icon" type="image/png" href="https://service-jobs-images.s3.us-east-2.amazonaws.com/7rl98t1weu387r43il97h6ipk1l7">
                <script src="https://cdn.tailwindcss.com"></script>
                <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
                <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
                <style>
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
            <body class="bg-gray-100">
                <header class="gradient-bg text-white py-16">
                    <div class="container mx-auto text-center">
                        <img src="https://service-jobs-images.s3.us-east-2.amazonaws.com/7rl98t1weu387r43il97h6ipk1l7" alt="LlamaPress Logo" class="h-40 mx-auto mb-8" data-aos="zoom-in">
                        <h1 class="text-5xl font-bold mb-4" data-aos="fade-up" data-aos-delay="200">Welcome to LlamaPress 🦙</h1>
                        <h2 class="text-2xl mb-8" data-aos="fade-up" data-aos-delay="400">The Free AI-Powered Growth Engine for Small Business Lead Generation</h2>
                        <a href="#get-started" class="bg-white text-indigo-600 font-semibold py-3 px-8 rounded-full hover:bg-indigo-100 transition duration-300" data-aos="fade-up" data-aos-delay="600">Get Started</a>
                    </div>
                </header>

                <section class="bg-white rounded-lg shadow-lg p-8 mb-12 text-center" data-aos="fade-up">
                    <h3 class="text-2xl font-bold mb-6">How LlamaPress Works</h3>
                    <div class="flex justify-center">
                        <img src="https://service-jobs-images.s3.us-east-2.amazonaws.com/1ws6omjel5kus3akeqoflvp8eje4" alt="LlamaPress Workflow" class="w-full max-w-4xl rounded-lg shadow-md" data-aos="zoom-in">
                    </div>
                    <p class="mt-6 text-gray-600 max-w-2xl mx-auto">LlamaPress simplifies your digital marketing journey with AI-powered tools and expert guidance.</p>
                </section>

                <main class="container mx-auto px-4 py-16">
                    <article class="bg-white rounded-lg shadow-lg p-8 mb-12" data-aos="fade-up">
                        <p class="mb-4">Small businesses often struggle to compete with larger companies that have deep marketing budgets. LlamaPress is here to level the playing field by providing an open-source, AI-driven platform that helps you build your website and marketing funnels — all focused on one goal: bringing in more leads to grow your business.</p>
                    </article>

                    <article class="bg-white rounded-lg shadow-lg p-8 mb-12" data-aos="fade-up">
                        <div class="feature-icon">
                            <i class="fas fa-rocket"></i>
                        </div>
                        <h3 class="text-2xl font-bold mb-4">What is LlamaPress? 🚀</h3>
                        <p class="mb-4">LlamaPress is a free, open-source tool that empowers businesses to create high-converting websites and optimize their digital marketing campaigns. Whether you want to host and manage everything yourself, or you prefer an expert team to handle it for you, LlamaPress has you covered.</p>
                    </article>

                    <article class="bg-white rounded-lg shadow-lg p-8 mb-12" data-aos="fade-up">
                        <div class="feature-icon">
                            <i class="fas fa-bullseye"></i>
                        </div>
                        <h3 class="text-2xl font-bold mb-4">Our Mission: Small Business Success 🎯</h3>
                        <p class="mb-4">We believe that every small business deserves the chance to succeed, and AI can make that possible. By leveraging advanced AI and automation, we make powerful digital marketing affordable and accessible. Our tools are designed to help you bring in more leads, grow revenue, and achieve your business goals — all without the hefty price tag of traditional marketing services.</p>
                    </article>

                    <article class="bg-white rounded-lg shadow-lg p-8 mb-12" data-aos="fade-up">
                        <div class="feature-icon">
                            <i class="fas fa-fire"></i>
                        </div>
                        <h3 class="text-2xl font-bold mb-4">🔥 The Problem We Solve: Generating Leads That Drive Revenue</h3>
                        <p class="mb-4">As a business owner, your biggest challenge is getting new leads. You want to grow your revenue, improve profitability, and achieve your dreams. With LlamaPress, you can:</p>
                        <ul class="list-disc list-inside mb-4">
                            <li>Build a professional website optimized to capture leads.</li>
                            <li>Run high-impact Google PPC campaigns that drive the right traffic.</li>
                            <li>Optimize your SEO strategy to climb the rankings and generate long-term leads.</li>
                        </ul>
                    </article>

                    <article class="bg-white rounded-lg shadow-lg p-8 mb-12" data-aos="fade-up">
                        <div class="feature-icon">
                            <i class="fas fa-briefcase"></i>
                        </div>
                        <h3 class="text-2xl font-bold mb-4">LlamaPress Marketing Agency Services</h3>
                        <p class="mb-4">If you're looking for hands-on help, our marketing agency can take the reins and do the heavy lifting for you. We specialize in delivering high-impact digital marketing solutions, designed to turn visitors into paying customers.</p>
                        
                        <h4 class="text-xl font-semibold mb-2">Website Development & Administration</h4>
                        <ul class="list-disc list-inside mb-4">
                            <li>Custom-built websites that are mobile-friendly and conversion-focused.</li>
                            <li>Easy-to-use content management, so you can update your site as your business grows.</li>
                        </ul>

                        <h4 class="text-xl font-semibold mb-2">Google PPC Campaigns</h4>
                        <ul class="list-disc list-inside mb-4">
                            <li>Keyword research and strategy to target high-value customers.</li>
                            <li>High-converting landing pages built with LlamaPress to capture leads.</li>
                            <li>Form capture and lead tracking using integrated Twilio phone numbers for full attribution.</li>
                            <li>Up to $250/month ad spend budget — perfect for testing and scaling campaigns.</li>
                        </ul>

                        <h4 class="text-xl font-semibold mb-2">SEO (Search Engine Optimization)</h4>
                        <ul class="list-disc list-inside mb-4">
                            <li>Comprehensive keyword research to position your business where customers are searching.</li>
                            <li>Long-form content creation to boost your rankings and attract organic traffic.</li>
                            <li>Full SEO setup, including internal linking, schema markup, and sitemap.xml generation.</li>
                        </ul>

                        <h4 class="text-xl font-semibold mb-2">Lead Capture, Reporting & ROI Tracking</h4>
                        <ul class="list-disc list-inside mb-4">
                            <li>Custom-built lead capture forms to drive conversions.</li>
                            <li>Analytics and lead attribution tools to show you exactly where your leads are coming from.</li>
                            <li>Advanced tracking with JavaScript visitor device info to provide deep insights into your audience.</li>
                        </ul>
                    </article>

                    <article class="bg-white rounded-lg shadow-lg p-8 mb-12" data-aos="fade-up">
                        <div class="feature-icon">
                            <i class="fas fa-code"></i>
                        </div>
                        <h3 class="text-2xl font-bold mb-4">Why Open Source?</h3>
                        <p class="mb-4">We believe in the power of community, freedom, and control. LlamaPress is built on open-source principles to give you full control over your marketing tools — without locking you into a costly platform. Whether you're a tech-savvy entrepreneur or need a full-service solution, we're here to support your success.</p>
                    </article>

                    <article id="get-started" class="bg-white rounded-lg shadow-lg p-8 mb-12" data-aos="fade-up">
                        <div class="feature-icon">
                            <i class="fas fa-paper-plane"></i>
                        </div>
                        <h3 class="text-2xl font-bold mb-4">Let's Get Started 🚀</h3>
                        <p class="mb-4">Ready to take your lead generation to the next level? Whether you want to DIY or let us handle it, LlamaPress has the tools and expertise to help your business thrive. Contact us today and start seeing real results from your marketing.</p>
                        <a href="#" class="inline-block bg-indigo-600 text-white font-semibold py-3 px-8 rounded-full hover:bg-indigo-700 transition duration-300">Contact Us</a>
                    </article>
                </main>

                <footer class="gradient-bg text-white py-8">
                    <div class="container mx-auto text-center">
                        <span class="text-xl font-semibold">Built with LlamaPress</span>
                        <img src="https://service-jobs-images.s3.us-east-2.amazonaws.com/7rl98t1weu387r43il97h6ipk1l7" alt="LlamaPress Logo" class="inline-block ml-4 h-10">
                    </div>
                </footer>

                <script>
                    AOS.init({
                        duration: 1000,
                        once: true,
                    });
                </script>
            </body>
            </html>   
        HTML
    end
end