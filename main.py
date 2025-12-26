import streamlit as st 
import os
from yt_dlp import YoutubeDL
from logic import download_option
import requests
from streamlit_lottie import st_lottie





if "page" not in st.session_state:
    st.session_state.page = "Home"
def engine():
    st.session_state.page = "Engine" 
def home():
    st.session_state.page = "Home" 
def pwd():
    st.session_state.page = "pwd"
def url():
    st.session_state.page = "url"
def format():
    st.session_state.page = "format"
def name():
    st.session_state.page = "name"
def animation():
    st.session_state.page = "animation"

def space():
    st.write("")




if st.session_state.page == "Home":  
    left, middle, right = st.columns([1,2,1])
    with middle:
        st.title("Welcome to Ydl")
    st.divider()
    st.write("""
            Ydl is a streamlined YouTube downloader built for users who value simplicity and control.
            With a guided flow and clear choices, Ydl removes the guesswork from downloading videos or extracting audio, allowing you to focus on what matters — your content.

            Whether you are downloading music, tutorials, or videos for offline use, Ydl provides a clean and reliable experience from start to finish.
            """)
    space()
    st.write("This is the begining phase of the project, hence the minimal interface")
    space()
    st.button("Let's Begin ",on_click=engine,use_container_width=True)
        

    
elif st.session_state.page == "Engine": 
    st.title("Lets Start.")
    space()
    st.write("""
            Okay, now in the follow up pages you will be asked some questions
            This are the questions that will help you to achieve the aim of using this application.
            When you have read through the various requirements and performed the associated task, you can click
            the next button to continue with the other remainig task
            
            And note: To avoid any errors, a ydl folder will be created to store the file
             """)
    
    left, middle1, middle2, right = st.columns([2,1,1,2])
    
    with left:
        st.button("Back", on_click=home )
    with right:
        st.button("Next",on_click=pwd)



# Second Page. [Creating the file directory]
elif st.session_state.page == "pwd":
    st .title("Query One")
    space()
    options = ["Yes","No"]
    st.pills("Would you like to know your current directory (location) ",options,selection_mode="single",key="pill1")
    
    if not st.session_state.pill1:
        st.error("Please pick an option")
    
    elif st.session_state.pill1 == "Yes":
        
        if "loc" not in st.session_state:
            st.session_state.loc = ""
        
        st.session_state.loc = os.getcwd()
        
        st.success(f"This is your directory '{st.session_state.loc}'")
        space()

    
        options = ["Yes","No"]
        st.pills("Would you like to create the folder 'ydl' in your current directory? ",options,selection_mode="single",key="pill2")

        if st.session_state.pill2 == "Yes":
            
            if "full_path" not in st.session_state:
                st.session_state.full_path = ""
                
            st.session_state.full_path = os.path.join(st.session_state.loc, "ydl")
            
            os.makedirs(st.session_state.full_path, exist_ok=True)
            

            st.success(f"The path to the created folder is {st.session_state.full_path}")
            
            if st.session_state.full_path:
                    left, middle1, middle2, right = st.columns([2,1,1,2])
    
                    with left:
                        st.button("Back" ,on_click=engine)
                    with             right:
                     st.button("Next",on_click=url)

            
        elif st.session_state.pill2 == "No":
            
            st.text_input("",placeholder="Please type in your desired path, for the ydl folder to be created: ",key="input1")
            
            if "full_path" not in st.session_state:
                st.session_state.full_path = ""
            
            if not os.path.exists(st.session_state.input1):
                st.error("Enter an accurate file path.")
            else:   
                st.session_state.full_path = os.path.join(st.session_state.input1, "ydl")
                
                os.makedirs(st.session_state.full_path, exist_ok=True)
                

                st.success(f"The path to the created folder is: ")
                st.markdown(f"""
                            You can copy this to open direectly into the folder
                            ```bash           
                                {st.session_state.full_path}
                            """)
                if st.session_state.full_path:
                        left, middle1, middle2, right = st.columns([2,1,1,2])
        
                        with left:
                            st.button("Back" ,on_click=engine)
                        with             right:
                            st.button("Next",on_click=url)

    
    elif st.session_state.pill1 == "No":
            
            st.text_input("", placeholder="Please type in your desired path, for the ydl folder to be created: ",key="input1")
            
            if "full_path" not in st.session_state:
                st.session_state.full_path = ""    
                
            if not os.path.exists(st.session_state.input1):
                st.error("Enter an accurate file path.")
            else:           
            
                st.session_state.full_path = os.path.join(st.session_state.input1, "ydl")
                
                os.makedirs(st.session_state.full_path, exist_ok=True)
                
                st.success(f"The path to the created folder is: ")
                st.markdown(f"""
                            You can copy this to open direectly into the folder
                            ```bash 
                                {st.session_state.full_path}
                            """)
            
                if st.session_state.full_path:
                        left, middle1, middle2, right = st.columns([2,1,1,2])
        
                        with left:
                            st.button("Back" ,on_click=engine)
                        with   right:
                            st.button("Next",on_click=url)



    
    # Page 3 [Obtaining the url.]

elif st.session_state.page == "url":
    
    st.title("Query Two")
      

    
    st.text_input("", placeholder="Enter the url of the file you want to download ",key="url_input")
    
    if st.session_state.url_input:
        st.session_state.choice_url = st.session_state.url_input
    
    if not st.session_state.url_input :
        st.error("Place a url in the space provided")
    else:
        left, middle1, middle2, right = st.columns([2,1,1,2])
        
        with left:
            st.button("Back" ,on_click=pwd)
        with  right:
            st.button("Next",on_click=format)
    


elif st.session_state.page == "format":

    
    st.title("Query Three")
    space()
    st.write("""
             This is where you select the form in which you want your video.
             The Extract option is quite special, enabling you to get the audio extract from the video.
             Really nice if you just want to play the song, not watch the video.
             """)
    forms =  ["Video","Audio","Extract"]
    space()
    st.pills("What would your choice be: ", forms , selection_mode="single" , key = "pill3")
    
    if st.session_state.pill3:
        st.session_state.format_choice = st.session_state.pill3
    
    if not st.session_state.pill3:
        st.error("Sorry, but you need to select one option.")
    
    else:
        left, middle1, middle2, right = st.columns([2,1,1,2])
        
        with left:
            st.button("Back" ,on_click=url)
        with  right:
            st.button("Next",on_click=name) 

elif st.session_state.page == "name":

    

    st.title("Query Four")
    
    chse = ["Custom","Default"]
    st.pills(
        "Would you like to use the default name of the file or you would like to give it a custom name",
        chse,
        key="pill4"
    )
    
    if st.session_state.pill4 == "Custom":
        
        st.text_input(
            "",
            placeholder="What name are you giving:",
            key = "output_name"
        )
        left, middle1, middle2, right = st.columns([2,1,1,2])
        
        with left:
            st.button("Back" ,on_click=format)
        with  right:
            st.button("Next",on_click=animation) 
        
    else:
        if "output_name" not in st.session_state:
            st.session_state.output_name = ""
        
        st.session_state.output_name = "%(title)s"
        
        left, middle1, middle2, right = st.columns([2,1,1,2])
        
        with left:
            st.button("Back" ,on_click=format)
        with  right:
            st.button("Next",on_click=animation) 
            


elif st.session_state.page =="animation":
    
    def load_lottie(url):
        r = requests.get(url)
        if r.status_code != 200:
            return None
        return r.json()

    # Example Lottie JSON URL (loading animation)
    lottie_json = load_lottie("https://assets1.lottiefiles.com/packages/lf20_j1adxtyb.json")
    
    
    if lottie_json:
        st_lottie(
            lottie_json,
            speed=1,
            loop=True,
            quality="high",
            height=300,
        )
    else:
        st.info("Animation failed to load.")

    
    opts = download_option(st.session_state.full_path,st.session_state.output_name)
    
    if st.session_state.format_choice == "Video":
        with YoutubeDL(opts["video"]) as down:
            down.download([st.session_state.choice_url])
    elif st.session_state.format_choice == "Audio":
        with YoutubeDL(opts["audio"]) as down:
            down.download([st.session_state.choice_url])   
    elif st.session_state.format_choice == "Extract":
        with YoutubeDL(opts["extract"]) as down:
            down.download([st.session_state.choice_url])    
            
            
    space()
    st.success("Completed")
    st.markdown(f"""
                Your file is in:
                ```bash
                    {st.session_state.full_path}
                """)