<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">Login</div>

                    <div class="card-body">
                        <form id="loginForm" method="POST" action="{{ route('login.user') }}">
                            @csrf

                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input id="email" type="email" class="form-control" name="email"
                                    value="{{ old('email') }}" required autofocus>
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input id="password" type="password" class="form-control" name="password" required
                                    autocomplete="current-password">
                            </div>

                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="remember">
                                <label class="form-check-label" for="remember">Remember me</label>
                            </div>

                            <button type="submit" class="btn btn-primary">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    document.getElementById('loginForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const formData = new FormData(this);

        fetch('{{ route('login.user') }}', {
                    method: 'POST',
                    body: formData
                })
            .then(response => response.json())
            .then(data => {
                // console.log(data.data.token,'efvrfve');
                if (data.data.token) {
                    localStorage.setItem('access_token', data.data.token); // Store token in localStorage
                    window.location.href = '/incomes'; // Replace with your actual route for the income page
                } else {
                    console.error(
                    'Token not received in response'); // Handle case where token is not received
                }
            })
            .catch(error => {
                console.error('Login error:', error);
                // Handle login error as needed
            });
    });
    </script>
</body>

</html>