import React, { Suspense } from "react";
import { Route, Switch } from "react-router-dom";
import Auth from "./hoc/auth";
// pages for this product
import LandingPage from "./components/views/LandingPage/LandingPage.js";
import LoginPage from "./components/views/LoginPage/LoginPage.js";
import RegisterPage from "./components/views/RegisterPage/RegisterPage.js";
import NavBar from "./components/views/NavBar/NavBar";
import Footer from "./components/views/Footer/Footer";
import UploadProductPage from "./components/views/UploadProductPage/UploadProductPage.js";

//null   Anyone Can go inside
//true   only logged in user can go inside
//false  logged in user can't go inside

/** Switch - Route로 생성된 자식컴포넌트중 매칭되는 첫번째 Route를 렌더링해줍니다. 
    보통 메인 Route의 url경로를 "/"로 지정하고 다른 Route에는 "/detail", "/login" 이런식으로 지정하게 되는데, 
    만약 Switch를 사용하지 않으면 그냥 메인페이지에 가기 위하여 
    "/" 경로를 접속했늗네 "/"가 포함된 "/detail", "/login" 컴포넌트들이 다 렌더링 되는 경우를 보게 됩니다.
    
    exact path - 정확히 일치하는 경로
    
    */

function App() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <NavBar />
      <div style={{ paddingTop: "69px", minHeight: "calc(100vh - 80px)" }}>
        <Switch>
          <Route exact path='/' component={Auth(LandingPage, null)} />
          <Route exact path='/login' component={Auth(LoginPage, false)} />
          <Route exact path='/register' component={Auth(RegisterPage, false)} />
          <Route
            exact
            path='/product/upload'
            component={Auth(UploadProductPage, true)}
          />
        </Switch>
      </div>
      <Footer />
    </Suspense>
  );
}

export default App;
