<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Validator;
class RegisterController extends Controller
{
    //
    public function registerView() {
        return view('auth.register');
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
    public function sendResponse($result, $message)

    {
        $response = [
            'success' => true,
            'data'    => $result,
            'message' => $message,
        ];
        return response()->json($response, 200);
    }
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
        ]);
     
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
    
        // if ($validator->fails()) {
        //     throw ValidationException::withMessages($validator->errors()->all());
        // }

        try {
            if ($request->role === 'admin' && ! $request->user()->isAdmin()) {
                throw ValidationException::withMessages(['role' => 'Unauthorized role assignment.']);
            }
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'role' => $request->role,
            ]);
            $token = $user->createToken('Personal Access Token')->accessToken;
            $success['token'] =  $user->createToken('MyApp')-> accessToken; 
            $success['name'] =  $user->name;
            return $this->sendResponse($success, 'User register successfully.');
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to register user'], 500);
        }
        
       
    }
}
