import streamlit as st

st.title("🚀 CI/CD Test App")
st.write("This is a simple Streamlit app deployed using Docker + GitHub Actions!")
st.write("If you see this page, your CI/CD pipeline was successful 🎉")

name = st.text_input("Enter your name:")
if name:
    st.success(f"Hello, {name} 👋 Welcome to CI/CD pipeline testing!")
