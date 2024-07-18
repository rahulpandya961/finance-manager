<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
class LoginController extends Controller
{
    //
    public function sendResponse($result, $message)

    {
        $response = [
            'success' => true,
            'data'    => $result,
            'message' => $message,
        ];
        return response()->json($response, 200);
    }
    public function sendError($error, $errorMessages = [], $code = 404)
    {
    	$response = [
            'success' => false,
            'message' => $error,
        ];


        if(!empty($errorMessages)){
            $response['data'] = $errorMessages;
        }


        return response()->json($response, $code);
    }
    public function loginView() {
        return view('auth.login');
    }
    public function login(Request $request)
    {
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){ 

            $user = Auth::user(); 

            $success['token'] =  $user->createToken('MyApp')-> accessToken; 

            $success['name'] =  $user->name;

   

            return $this->sendResponse($success, 'User login successfully.');

        } 

        else{ 

            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);

        } 
        // $request->validate([
        //     'email' => 'required|string|email',
        //     'password' => 'required|string',
        // ]);
        
        // Attempt to authenticate the user
        // if (! Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
        //     throw ValidationException::withMessages(['email' => 'Invalid credentials.']);
        // }
        // $user = Auth::user();
        

        // if ($user->isAdmin()) {
        //     $scopes = ['admin'];
        // } else {
        //     $scopes = ['user'];
        // }
    
        // $token = $user->createToken('Personal Access Token')->accessToken;
        // dd($token);
        // Generate a new access token
        
        // return response()->json(['token' => $token], 200);
    }

}