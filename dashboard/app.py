import streamlit as st
import pandas as pd

st.title("Cloud Security Dashboard")
df = pd.read_json("scanner/reports/latest_findings.json")
st.dataframe(df)

st.metric("Critical Findings", df[df['severity'] == 'CRITICAL'].shape[0])